
/* @pjs globalKeyEvents=true; */


///////////////////////////////////////////////////////////
// Variable definitions ///////////////////////////////////
///////////////////////////////////////////////////////////
DigitalSignature signature;
int blinkUpdate = -1;
String typedText = "";


///////////////////////////////////////////////////////////
// Init ///////////////////////////////////////////////////
///////////////////////////////////////////////////////////
void setup() {
    
    // Set screen size & renderer
    size(600, 600, P2D);
    strokeJoin(ROUND);
    noStroke();
    
    // Create font
    PFont font = createFont("Verdana", 24, true);
    textFont(font);
    
    // Init & create signature
    signature = new DigitalSignature(9, 0.0022, font);
    signature.create("OpenProcessing");
    
}


///////////////////////////////////////////////////////////
// Return a random string /////////////////////////////////
///////////////////////////////////////////////////////////
String getRandomSeed() {
    randomSeed(millis());
    return ((int)(random(9999999) + random(999999) + random(99999))).toString(36);
}


///////////////////////////////////////////////////////////
// Render /////////////////////////////////////////////////
///////////////////////////////////////////////////////////
void draw() {
    
    // Update signature
    signature.update();
    
    // Render signature
    background(#d7d7d7);
    signature.render();
    
    // Render text input
    if(blinkUpdate > -1) {
        pushStyle();
        fill(#a0a0a0);
        noStroke();
        rect(0, floor(32-textAscent()/2), width, floor(textAscent()+16));
        fill(#d7d7d7);
        text(typedText+(((millis()-blinkUpdate)) % 800 < 400 ? "|" : ""), floor(width/2-textWidth(typedText)/2), floor(40+textAscent()/2));
        popStyle();
    }
    
}


///////////////////////////////////////////////////////////
// Class that handles digital signatures //////////////////
///////////////////////////////////////////////////////////
class DigitalSignature {
    
    
    ///////////////////////////////////////////////////////////
    // Variable definitions ///////////////////////////////////
    ///////////////////////////////////////////////////////////
    PVector[][] v;
    int vertices;
    float minX, maxX, minY, maxY;
    PGraphics offscreen;
    float transform;
    float step;
    
    
    ///////////////////////////////////////////////////////////
    // Constructor ////////////////////////////////////////////
    ///////////////////////////////////////////////////////////
    DigitalSignature(int vertices, float step, PFont font) {
        
        // Assign values
        this.vertices = vertices;
        this.step = step;
        
        // Create vertex array
        this.vertices = vertices;
        v = new PVector[3][vertices+3];
        for(int i = 0; i < 3; i++) {
            for(int n = 0; n < vertices; n++)
                v[i][n] = new PVector();
            v[i][vertices] = v[i][0];
            v[i][vertices+1] = v[i][1];
            v[i][vertices+2] = v[i][2];
        }
        
        // Create offscreen buffer & asign font
        offscreen = createGraphics(width, height, P2D);
        offscreen.beginDraw();
        offscreen.strokeJoin(ROUND);
        offscreen.textFont(font);
        offscreen.endDraw();
        
    }
    
    
    ///////////////////////////////////////////////////////////
    // Get point on curve /////////////////////////////////////
    ///////////////////////////////////////////////////////////
    void pointOnCurve(PVector result, PVector p0, PVector p1, PVector p2, PVector p3, float t) {
        float t0 = ((-t + 2f) * t - 1f) * t * 0.5f;
        float t1 = (((3f * t - 5f) * t) * t + 2f) * 0.5f;
        float t2 = ((-3f * t + 4f) * t + 1f) * t * 0.5f;
        float t3 = ((t - 1f) * t * t) * 0.5f;
        result.set(p0.x * t0 + p1.x * t1 + p2.x * t2 + p3.x * t3,
                   p0.y * t0 + p1.y * t1 + p2.y * t2 + p3.y * t3,
                   p0.z * t0 + p1.z * t1 + p2.z * t2 + p3.z * t3);
    }
    
    
    ///////////////////////////////////////////////////////////
    // Create new signature from seed /////////////////////////
    ///////////////////////////////////////////////////////////
    void create(String seed) {
        
        // Set seed
        randomSeed(seed.hashCode());
        
        // Randomly distribute vertices
        for(int i = 0; i < 2; i++)
            for(int n = 0; n < vertices; n++)
                v[i][n].set(random(1), random(1));
        
        // Find signature bounds
        minX = 1; minY = 1; maxX = 0; maxY = 0; 
        PVector pointBuffer = new PVector();
        for(int i = 0; i < 2; i++)
            for(int n = 0; n < vertices; n++) {
                for(float t = 0; t < 1; t += 0.02) {
                    pointOnCurve(pointBuffer, v[i][n], v[i][n+1], v[i][n+2], v[i][n+3], t);
                    minX = min(pointBuffer.x, minX);
                    maxX = max(pointBuffer.x, maxX);
                    minY = min(pointBuffer.y, minY);
                    maxY = max(pointBuffer.y, maxY);
                }
            }
            
        // Scale signature
        float xScale = (width-160) / (maxX-minX),
              yScale = (height-160) / (maxY-minY);
        for(int i = 0; i < 2; i++) {
            for(int n = 0; n < vertices; n++) {
                v[i][n].x = 80 + (v[i][n].x-minX) * xScale;
                v[i][n].y = 80 + (v[i][n].y-minY) * yScale;
            }
        }
        
        // Precalculate distance between curves (speed wise not really neccessary)
        for(int n = 0; n < vertices; n++) {
            v[0][n].z = (v[1][n].x-v[0][n].x);
            v[1][n].z = (v[1][n].y-v[0][n].y);
        }
        
        // Generate line color, clear background & print seed
        float r = random(90), g = random(90), b = random(90), grey = (r+b+g) / 3;
        offscreen.beginDraw();
        offscreen.background(#d7d7d7);
        offscreen.fill(#a0a0a0);
        offscreen.text(seed, floor(offscreen.width/2-offscreen.textWidth(seed)/2), floor(offscreen.height-40+offscreen.textAscent()/2));
        offscreen.stroke(constrain(90 + r - grey, 0, 255), constrain(90 + g - grey, 0, 255), constrain(90 + b - grey, 0, 255), 10);
        offscreen.noFill();
        offscreen.strokeWeight(1);
        offscreen.endDraw();
        
        // Reset tranformation
        transform = 0;
        
    }
    
    
    ///////////////////////////////////////////////////////////
    // Check if sagnature is ready ////////////////////////////
    ///////////////////////////////////////////////////////////
    boolean isReady() {
        return transform > 1;
    }
    
    
    ///////////////////////////////////////////////////////////
    // Transform signature ////////////////////////////////////
    ///////////////////////////////////////////////////////////
    void update() {
        if(transform < 1) {
            transform += step;
            if(transform > 1)
                transform = 1;
            float factor = 0.5 + 0.5 * cos(PI + PI * transform);
            for(int n = 0; n < vertices; n++) {
                v[2][n].x = v[0][n].x + factor * v[0][n].z;
                v[2][n].y = v[0][n].y + factor * v[1][n].z;
            }
        } else
            transform = 2;
    }
    
    
    ///////////////////////////////////////////////////////////
    // Render signature ///////////////////////////////////////
    ///////////////////////////////////////////////////////////
    void render() {
        if(transform < 1) {
            
            // Render colored curve on buffer & buffer on screen
            offscreen.beginDraw();
            offscreen.beginShape();
            for(int n = 0; n < vertices+3; n++)
                offscreen.curveVertex(v[2][n].x, v[2][n].y);
            offscreen.endShape();
            offscreen.endDraw();
            image(offscreen, 0, 0);
            
            // Render black curve on screen
            pushStyle();
            stroke(#000000, 190);
            strokeWeight(3);
            noFill();
            beginShape();
            for(int n = 0; n < vertices+3; n++)
                curveVertex(v[2][n].x, v[2][n].y);
            endShape();
            popStyle();
            
        } else if(transform == 1) {
            
            // Render black curve on buffer & buffer on screen
            offscreen.beginDraw();
            offscreen.stroke(#000000, 190);
            offscreen.strokeWeight(3);
            offscreen.beginShape();
            for(int n = 0; n < vertices+3; n++)
                offscreen.curveVertex(v[2][n].x, v[2][n].y);
            offscreen.endShape();
            offscreen.endDraw();
            image(offscreen, 0, 0);
            
        } else
            image(offscreen, 0, 0); // Render buffer on screen
    }
    
    
}


///////////////////////////////////////////////////////////
// Compute text input /////////////////////////////////////
///////////////////////////////////////////////////////////
void keyReleased() {
    
    // Compute ASCII key input
    int blink = millis();
    if(key != CODED) {
        switch(key) {
            case BACKSPACE: case DELETE:
                if(typedText.length() == 0)
                    blink = -1;
                typedText = typedText.substring(0, max(0, typedText.length()-1));
            break;
            case TAB:
                typedText += "   ";
            break;
            case ENTER: case RETURN:
                signature.create(typedText);
                blink = -1;
            break;
            default:
                typedText += (int)key > 31 ? String.fromCharCode(key) : "";
        }
    }
    
    // Compute Non-ASCII key input
    switch(keyCode) {
        case 127: // Workaround: If BACKSPACE/DELETE do not work on your browser
            if(typedText.length() == 1)
                blink = -1;
            typedText = typedText.substring(0, max(0, typedText.length()-2));
        break;
        case 17: // Workaround: If RETURN/ENTER do not work on your browser
            signature.create(typedText);
            blink = -1;
        break;
        case 18: // Save signature
            if(blinkUpdate == -1 && signature.isReady())
                saveFrame("YourSignature.png");
            blink = -1;
    }
    
    // Update text input status
    blinkUpdate = blink;
    if(blink == -1)
        typedText = "";
    
}


///////////////////////////////////////////////////////////
// Create new random signature ////////////////////////////
///////////////////////////////////////////////////////////
void mouseClicked() {
    signature.create(getRandomSeed());
    blinkUpdate = -1;
    typedText = "";
}
