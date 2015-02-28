
import saito.objloader.*;

OBJModel model ;

float rotX, rotY;

void setup()
{
    size(400, 300, P3D);
    frameRate(30);
    ///keep your poly count 32000 and below for obj files
    model = new OBJModel(this, "morbo_T.obj", "absolute", TRIANGLES);
    model.enableDebug();

    model.scale(100);
    model.translateToCenter();

    stroke(255);
    noStroke();
}



void draw()
{
    background(0);
    //lights();
    
    //adds directional light to position of mouse
    float dirY = (mouseY / float(height) - 0.5) * 2;
    float dirX = (mouseX / float(width) - 0.5) * 2;
    directionalLight(204, 204, 204, -dirX, -dirY, -1);
    
    pushMatrix();
    translate(width/2, height/2, 0);
    rotateX(rotY);
    rotateY(rotX);

    model.draw();

    popMatrix();
}

boolean bTexture = true;
boolean bStroke = false;

void keyPressed()
{
    if(key == 't') {
        if(!bTexture) {
            model.enableTexture();
            bTexture = true;
        } 
        else {
            model.disableTexture();
            bTexture = false;
        }
    }

    if(key == 's') {
        if(!bStroke) {
            stroke(255);
            bStroke = true;
        } 
        else {
            noStroke();
            bStroke = false;
        }
    }

    else if(key=='1')
        model.shapeMode(POINTS);
    else if(key=='2')
        model.shapeMode(LINES);
    else if(key=='3')
        model.shapeMode(TRIANGLES);
}

void mouseDragged()
{
    rotX += (mouseX - pmouseX) * 0.01;
    rotY -= (mouseY - pmouseY) * 0.01;
}


