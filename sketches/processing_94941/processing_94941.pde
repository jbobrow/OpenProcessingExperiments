
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/64121*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
/* I am a big believer in software reuse.  I took some great examples and made them more useful.
 * The complement argument will apply the effect to any black pixel if true, non-black if false.
 * bobcook47@hotmail.com  feel free to send improvements or additions
 */
EffectFireworks pg;
EffectFire pg1;
EffectFire pg11;
EffectGradientLinear pg2;
EffectGradientLinear pg22;
EffectGradientLinear pg222;
EffectGradientRadial pg3;
EffectGradientRadial pg33;
EffectGradientWave pg4;
EffectGradientWave pg44;
EffectLightning pg5;
EffectMetaball pg6;
EffectMetaball pg66;
EffectParticles pg7;
EffectPlasma pg8;
EffectSpray pg9;
//Hi pg10;

void setup() {
  size(640, 360, P2D);
  hint(ENABLE_STROKE_PURE);
  // Create buffered image for effect
  pg = new EffectFireworks(100,100);
  pg1 = new EffectFire(100,100);
  pg11 = new EffectFire(100,100);
  pg2 = new EffectGradientLinear(100,100);
  pg22 = new EffectGradientLinear(100,100);
  pg222 = new EffectGradientLinear(100,100);
  pg3 = new EffectGradientRadial(100,100);
  pg33 = new EffectGradientRadial(100,100);
  pg4 = new EffectGradientWave(100,100);
  pg44 = new EffectGradientWave(100,100);
  pg5 = new EffectLightning(100,100,4);
  pg6 = new EffectMetaball(100,100,6,20000,1,180,1);
  pg66 = new EffectMetaball(100,100,6,20000,1,180,1);
  pg7 = new EffectParticles(100,100,200,100,18);
  pg8 = new EffectPlasma(100,100);
  pg9 = new EffectSpray(100,100);
}

void draw() {
  PImage Hi1 = loadImage("Hi1.gif");
  PImage Hi2 = loadImage("Hi2.gif");
  PImage Oval = loadImage("Oval.gif");
  // Output into a buffered image for reuse
  
  //Box 1
  pg.begin();
  pg.fill(0xff0000);
  pg.textSize(48);
  pg.text("HI",20,50); 
  // display the results
  image(pg.end(),0,0);
  
  //Box 2
  pg1.begin();
  pg1.fill(0xff0000);
  pg1.textSize(48);
  pg1.text("HI",20,50);
  // display the results
  image(pg1.end(false),100,0);
  
  //Box 3
  pg11.begin();
  //display the results
  image(pg11.end(false),200,0);
  image(Oval, 200, 0);
  
  //Box 4
  pg2.begin(0xff00,0xff,true);
  pg2.fill(0xff0000);
  pg2.textSize(50);
  pg2.text("HI",20,50); 
  // display the results
  image(pg2.end(false),300,0);
  
  //Box 5
  pg22.begin(0xff00,0xff,true);
  // display the results
  image(pg22.end(false),400,0);
  image(Hi1, 400,0);
  
  //Box 6
  pg3.begin(50,50,50,0xff00,0xff);
  // display the results
  image(pg3.end(false),500,0);
  image(Hi2,500,0);
  
  //Box 7
  pg33.begin(50,50,50,0xff00,0xff);
  pg33.fill(0xff0000);
  pg33.textSize(80);
  pg33.text("HI",11,76); 
  // display the results
  image(pg33.end(false),0,100);
  
  //Box 8
  pg4.begin();
  // display the results
  image(pg4.end(false),100,100);
  image(Hi1,100,100);
  
  //Box 9
  pg44.begin();
  pg44.fill(0xff0000);
  pg44.textSize(80);
  pg44.text("HI",20,70); 
  // display the results
  image(pg44.end(false),200,100);
  
  //Box 10
  pg5.begin();
  pg5.fill(0xff0000);
  pg5.textSize(80);
  pg5.text("HI",20,70); 
  // display the results
  image(pg5.end(),300,100);
  
  //Box 11
  pg6.begin();
  pg6.fill(0xff0000);
  pg6.textSize(80);
  pg6.text("HI",20,70); 
  // display the results
  image(pg6.end(false),400,100);
  
  //Box 12
  pg66.begin();
  // display the results
  image(pg66.end(false),500,100);
  image(Hi1, 500,100);
  
  //Box 13
  pg7.begin(50,50);
  pg7.fill(0xff0000);
  pg7.textSize(80);
  pg7.text("HI",20,70); 
  // display the results
  image(pg7.end(),0,200);
  
  //Box 14
  pg8.begin();
  pg8.fill(0xff0000);
  pg8.textSize(80);
  pg8.text("HI",20,70); 
  // display the results
  image(pg8.end(false),100,200);
  //pg8.begin();
 // pg8.fill(0xff0000);
  //pg8.textSize(80);
  //pg8.text("HI",20,70); 
  // display the results
  //image(pg8.end(false),100,200);
  
  //Box 15
  pg9.begin(0xff00,4);
  pg9.fill(0xffffff);
  pg9.textSize(80);
  pg9.text("HI",20,70); 
  // display the results
  image(pg9.end(),200,200);
}
abstract class Effect {
  PGraphics pg;
  int width, height;
  protected Effect() {}
  Effect(int width, int height) {
    pg = createGraphics(width, height, P2D);
    this.width=width; this.height=height;
  }
  void begin() {
    pg.beginDraw();
    pg.loadPixels();
    pg.background(0);
    pg.pushStyle();
    pg.noSmooth();
  }
  void loadPixels() {pg.loadPixels();}
  void fill(int rgb) {pg.fill(rgb>>16,(rgb>>8)&0xff,rgb&0xff);}
  void stroke(int rgb) {pg.stroke(rgb>>16,(rgb>>8)&0xff,rgb&0xff);}
  void noFill() {pg.noFill();}
  void noStroke() {pg.noStroke();}
  void strokeWeight(int w) {pg.strokeWeight(w);}
  void background(int rgb) {pg.background(rgb);}
  void textSize(int size) {pg.textSize(size);}
  void text(String s, int x, int y) {pg.text(s,x,y);}
  void rect(int x, int y, int w, int h) {pg.rect(x,y,w,h);}
  void ellipse(int x, int y, int w, int h) {pg.ellipse(x,y,w,h);}
  abstract PImage end(boolean complement);
}
/**
 * Fire Cube demo effect
 * by luis2048.
 * 
 * A rotating wireframe cube with flames rising up the screen.
 * The fire effect has been used quite often for oldskool demos.
 * First you create a palette of 256 colors ranging from red to 
 * yellow (including black). For every frame, calculate each row 
 * of pixels based on the two rows below it: The value of each pixel, 
 * becomes the sum of the 3 pixels below it (one directly below, one 
 * to the left, and one to the right), and one pixel directly two 
 * rows below it. Then divide the sum so that the fire dies out as 
 * it rises.
 */
class EffectFire extends Effect {   
// This will contain the pixels used to calculate the fire effect
int[][] fire;

// Flame colors
final /*static*/ color[] palette= new color[255];
float angle;
int[] calc1,calc2,calc3,calc4,calc5;
/*static*/ boolean initialized;
void init() {
  pushStyle();
  colorMode(HSB);
  // Generate the palette
  for(int x = 0; x < palette.length; x++) {
    //Hue goes from 0 to 85: red to yellow
    //Saturation is always the maximum: 255
    //Lightness is 0..255 for x=0..128, and 255 for x=128..255
    palette[x] = color(x/3, 255, constrain(x*3, 0, 255));
  }
  popStyle();
  calc1 = new int[width];
  calc3 = new int[width];
  calc4 = new int[width];
  calc2 = new int[height];
  calc5 = new int[height];
  // Precalculate which pixel values to add during animation loop
  // this speeds up the effect by 10fps
  for (int x = 0; x < width; x++) {
    calc1[x] = x % width;
    calc3[x] = (x - 1 + width) % width;
    calc4[x] = (x + 1) % width;
  }
  
  for(int y = 0; y < height; y++) {
    calc2[y] = (y + 1) % height;
    calc5[y] = (y + 2) % height;
  }
  initialized=true;
}
  EffectFire(int width, int height) {
    pg = createGraphics(width, height,P2D);
    this.width=width; this.height=height;
    fire = new int[width][height];
    if (!initialized) init();
  }
  PImage end(boolean complement) {
    angle = angle + 0.05;
    // Randomize the bottom row of the fire buffer
    for(int x = 0; x < width; x++) {
      fire[x][height-1] = int(random(0,190)) ;
    }
  
    int counter = 0;
    // Do the fire calculations for every pixel, from top to bottom
    for (int y = 0; y < height; y++) {
      for(int x = 0; x < width; x++) {
        // Add pixel values around current pixel
        fire[x][y] =
            ((fire[calc3[x]][calc2[y]]
            + fire[calc1[x]][calc2[y]]
            + fire[calc4[x]][calc2[y]]
            + fire[calc1[x]][calc5[y]]) << 5) / 129;
            
        // Output everything to screen using our palette colors
        if (pg.pixels[counter]!=0xff000 ^ complement)  
            pg.pixels[counter] = palette[fire[x][y]];
        else if (!complement) pg.pixels[counter] = 0;
  
        // Extract the red value using right shift and bit mask 
        // equivalent of red(pg.pixels[x+y*w])
        if ((pg.pixels[counter++] >> 16 & 0xFF) == 128) {
          // Only map 3D cube 'lit' pixels onto fire array needed for next frame
          fire[x][y] = 128;
        }
      }
   }
    pg.updatePixels();
    pg.endDraw();
    pg.popStyle();
    return pg;
  }
}

class EffectFireworks extends Effect {
    float r = random(30, 100); //sets the maximum radius
    ArrayList listA = new ArrayList();
    boolean init;
    
    EffectFireworks(int width, int height) {
        super(width, height);
    }
    
    @Override
        void begin() {
        pg.beginDraw();
        pg.loadPixels();
        if (!init) {
            init=true; 
            pg.background(0);
        }
        pg.pushStyle();
        pg.smooth();
    }
    
    PImage end(boolean complement) {
        return end();
    }
    
    PImage end() {
        pg.colorMode(HSB, 100);
        if (frameCount % 6 == 0) {//fireworks gradually dissappear
            pg.noStroke();
            pg.fill(0.0, 10.0);
            pg.rect(0, 0, width, height);
        }
        
        if (random(0, 10)>5.5) {
            listA.add(new Senrin());
        } 
        
        if (random(0, 10)>5.5) {
            listA.add(new Ring());
        } 
        
        if (random(0, 10)>5.5) {
            listA.add(new Hanabi());
        } 

        for (int counter = 0; counter < listA.size(); counter++) {
            Hanabi h = (Hanabi)(listA.get(counter));
            if (h.isAlive()) {
                h.update();
                //if(h.explosionSound()){
                //  snip = minim.loadSnippet("ban.wav");
                //  snip.play();
                //}
            }
            else {
                h.removeBoom();
                listA.remove(counter);
                counter--;
            }
        } //for   
        pg.updatePixels();
        pg.endDraw();
        pg.popStyle();
        return pg;
    }

    class Hanabi {
        float x, curY, gravity, radius, curr;  
        float v, accel;
        color rainbow;
        boolean exploding, justExploded;

        Hanabi() {
            x = random(width/6, width*5/6);
            curY = height;
            curr= 1;
            radius = random(70, 300);
            rainbow = color(random(0, 100), 0, 100); //99
            exploding = false;
            justExploded = false;

            v = -random(5, 15);
            accel = random(0, 0.2);
        }

        void update() {
            generateColor();
            v += accel;
            curY += v;
            if (v < 0 && !exploding) {
                risingSeed();
            }
            else {
                accel = 0.05;
                explosion();
                exploding = true;
            }
        }

        boolean explosionSound() {
            if (justExploded == false && exploding == true) {
                justExploded = true;
                return true;
            }
            else 
                return false;
        }

        void generateColor() {//generates gradual change in color
            float s = random(10, 240);
            float h = hue(rainbow);
            float a ;
            h+=1;
            if (exploding) {
                a = 40 -v*10;
            }
            else {
                a = v*10 + 100;
            }
            rainbow = color(h, s, 100, a);
        }

        void risingSeed() {
            drawSparkles();
        }

        void explosion() {//creates a circle of circles
            pg.pushMatrix();
            pg.translate(x, curY);
            pg.noStroke();
            pg.fill(rainbow);
            if (curr < radius) {
                curr+=2;
            }
            float sRadius = random(1, 6);
            for (int deg = 0; deg < 360; deg += 12) {
                float angle = radians(deg);
                float tempx =(cos(angle)* curr);
                float tempy = (sin(angle) * curr);
                pg.ellipse(tempx, tempy, sRadius, sRadius);
            }
            pg.popMatrix();
        }

        void drawSparkles() {//draws sparkles (for when mouse not pressed)
            pg.pushMatrix();
            pg.stroke(rainbow, 50);
            pg.translate(x, curY);
            pg.strokeWeight(1);
            pg.noFill();
            pg.ellipse(0, 0, 10, 10);
            float randX = random(-30, 30);
            float randY = random(-30, 30);
            float randL = random(1, 5);
            drawPlus(randX, randY, randL);
            pg.popMatrix();
        }

        void drawPlus(float x, float y, float l) {//draws plus signs in different angles
            pg.rotate(random(0, PI));
            pg.line(x-l, y, x+l, y);
            pg.line(x, y-l, x, y+l);
        }

        boolean isAlive() {
            if (1.0 - v * 10.0 < 0.0)
                return false;
            return true;
        }
        void removeBoom(){
            pg.pushMatrix();
            this.rainbow = color(0, 0, 0, 0);
            pg.noStroke();
            pg.noFill();
            pg.popMatrix();
        }
    }
    
    class Ring extends Hanabi {
        float angleX, angleY, velX;
        int interval;
        Ring() {
            super();
            angleX = random(0.9, 1);
            angleY = random(0.7, 1);
            curr = radius/2; 
            velX = random(-6, 6);
        }

        void update() {
            if (interval>3) {
                v += accel;
                x +=velX;
                curY += v;
                
                if (v <0 && !exploding) {
                    generateColor();
                    risingSeed();
                }
                else {
                    accel = 0.05;
                    explosion();
                    exploding = true;
                    generateColor();
                }
                
                interval = 0;
            }
            else
                interval++;
        }

        void generateColor() {
            super.generateColor();
            float a;
            
            if (exploding) {
                a =20 -v*10;
            }
            else {
                a = v*10 + 100;
            }
            
            rainbow = color(hue(rainbow), saturation(rainbow), 200, a);
        }

        void explosion() {//creates a circle of circles
            pg.pushMatrix();
            pg.translate(x, curY);
            pg.noStroke();
            pg.fill(rainbow);
            
            if (curr < radius) {
                curr = curr +(radius - curr) * 0.1;
            }
            
            float sRadius = random(8, 15);
            pg.rotate(random(-5, 5));
            
            for (int deg = 0; deg < 360; deg += 20) {
                float angle = radians(deg);
                float tempx =(cos(angle)* curr * angleX);
                float tempy = (sin(angle) * curr * angleY);
                pg.ellipse(tempx, tempy, sRadius, sRadius);
            }
            
            pg.popMatrix();
        }
    }

    class Senrin extends Hanabi {
        float[][] position;
        float myHue, overall, velX;

        Senrin() {
            super();
            overall = random(70, 150);
            position = new float[int(random(3, 10))][2];
            
            for (int r = 0; r < position.length; r++) {
                for (int s = 0; s < position[r].length ; s++) {
                    position[r][s] = random(-overall, overall);
                }
            }
            
            curr=0.1;
            radius = random(70, 120);
            myHue = random(0, 255);
            velX = random(-1.5, 1.5);
        }
        
        void update() {
            x += velX;
            super.update();

            if (exploding) {
                for (int r = 0; r < position.length; r++) {
                    for (int s = 0; s < position[r].length ; s++) {
                        explosion(position[r][0], position [r][1]);
                    }
                }
            }
        }
        
        void generateColor() {
            super.generateColor();
            float s, a;
            
            if (exploding) {
                a =20 -v*10;
                s = 200 - v*40;
            }
            else {
                s = 200;
                a = v*10 + 100;
            }
            
            rainbow = color(myHue, s, 255, a);
        }

        void explosion(float myX, float myY) {
            pg.pushMatrix();
            pg.translate(x+myX, curY+myY);
            pg.noStroke();
            pg.fill(rainbow);
            
            if (curr < radius) {
                curr = curr +(radius - curr) * 0.00000001;
            }
            
            float sRadius = random(1, 3);
            
            for (int deg = 0; deg < 360; deg += 10) {
                float angle = radians(deg);
                float tempx =(cos(angle)* curr);
                float tempy = (sin(angle) * curr);
                pg.ellipse(tempx, tempy, sRadius, sRadius);
            }
            
            pg.popMatrix();
        }
    }
}

class EffectGradientLinear extends Effect {
  int color1=0xff0000, color2=0xff; boolean xaxis;
  EffectGradientLinear(int width, int height) {super(width,height);}
  void begin(color c1, color c2, boolean xaxis) {
    super.begin();
    color1=c1; color2=c2;
    this.xaxis=xaxis;
  }
  PImage end(boolean complement) {
    setGradient(color1, color2, complement);
    pg.updatePixels();
    pg.endDraw();
    pg.popStyle();
    return pg;
  }
  void setGradient(color c1, color c2, boolean complement) {
    final int x=0; final int y=0; final int w=width; final int h=height;
    // calculate differences between color components 
    float deltaR = red(c2)-red(c1);
    float deltaG = green(c2)-green(c1);
    float deltaB = blue(c2)-blue(c1);
  
    // choose axis
    if(xaxis) {
      // nested for loops set pixels
      // in a basic table structure
      // column
      for (int i=x; i<(x+w); i++){
        // row
        for (int j = y; j<(y+h); j++){
          color c = color((red(c1)+(j-y)*(deltaR/h)),(green(c1)+(j-y)*(deltaG/h)),(blue(c1)+(j-y)*(deltaB/h)) );
          if (pg.pixels[i+j*h]!=0xff000000 ^ complement)
            pg.pixels[i+j*h] = c;
          else if (!complement) pg.pixels[i+j*h]=0;
        }
      }  
    }  
    else {
      // column 
      for (int i=y; i<(y+h); i++){
        // row
        for (int j = x; j<(x+w); j++){
          color c = color((red(c1)+(j-x)*(deltaR/h)),(green(c1)+(j-x)*(deltaG/h)),(blue(c1)+(j-x)*(deltaB/h)));
          if (pg.pixels[j+i*h]!=0xff000000 ^ complement)
            pg.pixels[j+i*h] = c;
          else if (!complement) pg.pixels[j+i*h]=0;
        } // for j
      }  // for i
    }
  }
}
class EffectGradientRadial extends Effect {
  float radius=20, x, y;
  int color1=0xff0000, color2=0xff;
  int temp[]=new int[width*height];
  EffectGradientRadial(int width, int height) {super(width,height);}
  void begin(float x, float y, float radius, color c1, color c2) {
    super.begin();
    pg.background(200);
    this.x=x; this.y=y; this.radius=radius; color1=c1; color2=c2;
  }
  PImage end(boolean complement) {
    float px = 0, py = 0, angle = 0;
  // calculate differences between color components 
  float deltaR = red(color2)-red(color1);
  float deltaG = green(color2)-green(color1);
  float deltaB = blue(color2)-blue(color1);
  // hack to ensure there are no holes in gradient
  // needs to be increased, as radius increases
  float gapFiller = 8.0;

  for (int i=0; i< radius; i++){
    for (float j=0; j<360; j+=1.0/gapFiller){
      px = x+cos(radians(angle))*i;
      py = y+sin(radians(angle))*i;
      angle+=1.0/gapFiller;
      int z=int(px) + pg.width*int(py);
      if (z<0 || z>=width*height) continue;
      color c = color(
      (red(color1)+(i)*(deltaR/radius)),
      (green(color1)+(i)*(deltaG/radius)),
      (blue(color1)+(i)*(deltaB/radius)) 
        );
      temp[z]=c;      
    }
  }
    for (int i=0; i<width*height; i++) {
      if (pg.pixels[i]!=0xff000000 ^ complement)
        pg.pixels[i] = temp[i];
      else if (!complement) pg.pixels[i]=0;
    }
    pg.updatePixels();
    pg.endDraw();
    pg.popStyle();
    return pg;
  }
}
class EffectGradientWave extends Effect {
  int temp[]=new int[width*height];
  EffectGradientWave(int width, int height) {super(width,height);}
  PImage end(boolean complement) {
  float angle = 0; 
  float px = 0, py = 0;
  float amplitude = 20;
  float frequency = 0;
  float fillGap = 2.5;
    for (int i =0; i < height; i++){
    // Reset angle to 0, so waves stack properly
    angle = 0;
    // Increasing frequency causes more gaps
    frequency+=.006;
    for (float j=0; j<width; j++){
      py = i+sin(radians(angle))*amplitude;
      angle+=frequency;
      int c =  color(abs(py-i)*255/amplitude, 255-abs(py-i)*255/amplitude, j*(255.0/(width+50)));
      if (py<0 || py>=width) continue;
      int z=int(j) + int(py)*width;
      temp[z] = c;
      // Hack to fill gaps. Raise value of fillGap if you increase frequency
      for (int filler = 0; filler<fillGap; filler++) {
        z=int(j-filler)+(int(py)-filler)*width;
        if (z>=0 && z<width*height)
        temp[z]=c;
        z=int(j+filler) + (int(py)+filler)*width;
        if (z>=0 && z<width*height)
        temp[z]=c;
      }
    }
  }
  for (int i=0; i<width*height; i++) {
      if (pg.pixels[i]!=0xff000000 ^ complement)
        pg.pixels[i] = temp[i];
      else if (!complement) pg.pixels[i]=0;
    }
    pg.updatePixels();
    pg.endDraw();
    pg.popStyle();
    return pg;
  }
}
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/59875*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
// **Created by Aparna J. Nambiar
//Displays lightning strokes
class EffectLightning extends Effect {
    Lightning l1, l2; 
    int branchX;
    int branchY;
    int branchTarX;
    int branchTarY;
    int counter;
    int innerCounter;
    int direction;
    boolean init;
    Lightning[] l = new Lightning[20];
    int lightningCount=5;
    int finishCount=0, weight;
    EffectLightning(int width, int height, int weight) {
        super(width, height);
        counter=0;
        this.weight=weight;
        int rootX=(int)random(width/5, width*4/5);
        int rootY=(int)random(0, 5);
        for (int i=0;i<lightningCount;i++) {
            l[i] = new Lightning((int)random(width/5, width*4/5), (int)random(0, 5), weight, 2, 600);
        }
    }
    @Override
        void begin() {
        pg.beginDraw();
        if (!init) {
            init=true; 
            pg.background(0);
        }
        pg.loadPixels();
        pg.pushStyle();
        pg.smooth();
    }
    PImage end(boolean complement) {
        return end();
    }
    PImage end() {
        for (int i=0;i< lightningCount;i++) {
            if (l[i]!=null) {
                l[i].draw();
            }
        }
        counter++;

        if (counter>0 && counter%21==0 && lightningCount<l.length) {
            int chosen = (int) random(0, 3);
            branchX = l[chosen].rootX;
            branchY = l[chosen].rootY;

            l[lightningCount] = new Lightning(branchX, branchY, weight, (int)random(0, 2), 50);
            lightningCount++;
        }

        if (finishCount>=1) {
            pg.updatePixels();
            pg.background(0);
            for (int i=0;i<3;i++) {
                l[i] = new Lightning((int)random(width/5, width*4/5), (int)random(0, 5), weight, 2, 600);
                l[i].draw();
            }

            for (int i=3;i<lightningCount;i++) {
                l[i] = null;
            }
            lightningCount = 3;
            finishCount = 0;
        }   

        pg.endDraw();
        pg.popStyle();
        return pg;
    }

    public class Lightning {
        int rootX; 
        int rootY;
        int targetX;
        int targetY;
        int weight;
        float negDirection, posDirection;
        int localCounter;
        int maxLength;
        public Lightning (int rootx, int rooty, int strokeWeight, int direction, int length) {
            this.rootX= rootx;
            this.rootY = rooty;
            this.weight = strokeWeight;
            maxLength = length;
            localCounter =1;
            if (direction ==2) {
                negDirection =0.5;
                posDirection =0.5;
            }
            else if (direction ==1) {
                negDirection =0;
                posDirection =1;
            }
            else if (direction ==0) {
                negDirection =1;
                posDirection =0;
            }
        }

        public void draw() {
            if (localCounter< maxLength) {   
                localCounter++;
                targetX=rootX+(int)random(-8 * negDirection, 8 * posDirection);
                targetY=rootY+(int)random(0, 5);
                pg.stroke(255);
                pg.strokeWeight(weight);
                pg.line(rootX, rootY, targetX, targetY);
                rootX=targetX;
                rootY=targetY;
            }
            if (targetY>=height) {
                finishCount++;
                localCounter=0;
            }
        }
    }
}

/**
 * Metaball Demo Effect
 * by luis2048. 
 * 
 * Organic-looking n-dimensional objects. The technique for rendering 
 * metaballs was invented by Jim Blinn in the early 1980s. Each metaball 
 * is defined as a function in n-dimensions. 
 */
class EffectMetaball extends Effect {
  int numBlobs, blobSize,c1,c2,c3;

int[] blogPx;
int[] blogPy;

// Movement vector for each blob
int[] blogDx;
int[] blogDy;

int[][] vy,vx;
   //c1,c2,c3   two must be set to 1, the third can be 0-255 but not 1
   EffectMetaball(int width, int height, int nBlobs, int blobSize, int c1,int c2,int c3) {
     super(width,height);
     numBlobs=nBlobs;
     this.blobSize=Math.min(abs(blobSize)+1000,200000);
     this.c1=c1; this.c2=c2; this.c3=c3;
     vy = new int[numBlobs][height];
     vx = new int[numBlobs][width];
     blogPx = new int[numBlobs];
     blogPy = new int[numBlobs];
     blogDx = new int[numBlobs];
     blogDy = new int[numBlobs];
     for (int i=0; i<numBlobs; ++i) {
      blogPx[i]=i*(int)random(60);
      blogPy[i]=i*(int)random(60);
      blogDx[i]=blogDy[i]=1;
     }
   }
   PImage end(boolean complement) {
      for (int i=0; i<numBlobs; ++i) {
    blogPx[i]+=blogDx[i];
    blogPy[i]+=blogDy[i];

    // bounce across screen
    if (blogPx[i] < 0) {
      blogDx[i] = 1;
    }
    if (blogPx[i] > pg.width) {
      blogDx[i] = -1;
    }
    if (blogPy[i] < 0) {
      blogDy[i] = 1;
    }
    if (blogPy[i] > pg.height) {
      blogDy[i]=-1;
    }

    for (int x = 0; x < pg.width; x++) {
      vx[i][x] = int(sq(blogPx[i]-x));
    }

    for (int y = 0; y < pg.height; y++) {
      vy[i][y] = int(sq(blogPy[i]-y)); 
    }
  }

  // Output into a buffered image for reuse
  for (int y = 0; y < pg.height; y++) {
    for (int x = 0; x < pg.width; x++) {
      int m = 1;
      for (int i = 0; i < numBlobs; i++) {
        // Increase this number to make your blobs bigger
        m += blobSize/(vy[i][y] + vx[i][x]+1);
      }
      int c=color(c1==1?m+x:c1, c2!=1?c2:(c1==1?(x+m+y)/2:m+x), c3!=1?c3:(x+m+y)/2);
      int z=x+y*pg.width;
      if (pg.pixels[z]!=0xff000000 ^ complement)
      pg.pixels[z] = c;
      else if (!complement) pg.pixels[z]=0;
    }
  }   
  pg.updatePixels();
  pg.endDraw();
  pg.popStyle();
  return pg;
  }
}
class EffectParticles extends Effect {

    int particleNumber = 900;
    int counter = 0;
    int finishCount = 0;
    int EffectParticleCount = 0;

    // max radius particle bowl
    int maxRadius = 180;

    // particle class
    EffectParticle[] particleEllipse; 

    // particle size
    int partSize = 64;
    float partX = 0, partY = 0;
    boolean init;

    EffectParticles(int width, int height, int nParticles, int radius, int particleSize) {
        super(width, height);
        particleNumber=nParticles;
        partSize=particleSize;
        // multiply because maxRadius will be sqrt in draw
        maxRadius = radius*radius;

        // init particles
        makeParticles();
    }
    void begin(int x, int y) {
        super.begin();
        if (!init) {
            init=true; 
            pg.background(0);
        }
        for (int i = 0; i < particleEllipse.length; i++) {
            particleEllipse[i].display();
            particleEllipse[i].move(x, y);
            particleEllipse[i].tweak(maxRadius, partSize);
        }
        pg.loadPixels();
        pg.pushStyle();
    }
    PImage end(boolean complement) {
        return end();
    }
    PImage end() {
        for (int i = 0; i < EffectParticleCount; i++) {
            if (particleEllipse[i] != null) {
                particleEllipse[i].draw();
            }
        }
        counter++;

        if (counter > 0 && counter % 20 == 0 && EffectParticleCount < particleEllipse.length) {
            int chosen = (int) random(0, particleNumber);
            partX = particleEllipse[chosen].centerX;
            partY = particleEllipse[chosen].centerY;

            particleEllipse[EffectParticleCount] = new EffectParticle(int(random(maxRadius)));
            EffectParticleCount++;
        }

        if (finishCount >= 1) {
            pg.updatePixels();
            pg.background(0);
            
            for (int i = 0; i < 3; i++) {
                particleEllipse[i] = new EffectParticle(int(random(maxRadius)));
                particleEllipse[i].draw();
            }
            
            for (int i = 3; i < EffectParticleCount; i++) {
                particleEllipse[i] = null;
            }
            
            EffectParticleCount = 0;
            finishCount = 0;
            counter = 0;
        }
        
        pg.endDraw();
        pg.popStyle();
        return pg;
    }
    
    void makeParticles() {
        // init particles, particleNumber = the number of particles that will be made
        particleEllipse = new EffectParticle[particleNumber];
        for (int i = 0; i < particleEllipse.length; i++) {
            particleEllipse[i] = new EffectParticle(int(random(maxRadius)));
        }
    }
    /* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/52842*@* */
    /* !do not delete the line above, required for linking your tweak if you re-upload */
    // Particle Ellipse 
    // By Apewire
    class EffectParticle {
        // ellipse center position
        float centerX;
        float centerY;  
        // previous particle x,y pos
        float prevX;
        float prevY;
        // new particle x and y pos 
        float nextX;
        float nextY;
        // current particle x and y pos
        float currX;
        float currY;
        // lerp
        float lerpValue = 0;
        float lerpSpeed = 0.5;
        // particle size
        float partSize = random(16); 
        // particle color;
        color partColor;
        int maxPartAlhpa = 150;
        int partAlpha = maxPartAlhpa;
        boolean newAlpha = false;
        int localCounter;

        // max ellipse radius
        int partBorder; 

        EffectParticle(int _partBorder) {
            partBorder = _partBorder;
            partColor = color(random(255), random(255), random(255));
            localCounter = 1;
        }

        void tweak(int _partBorder, int _partSize) {
            partBorder = _partBorder;
            partSize = random(_partSize);
        }

        void display() {
            pg.noStroke();
            pg.fill(partColor, partAlpha);
            pg.ellipse(currX, currY, partSize, partSize);
        }

        void move() {
            centerX = width/2;
            centerY = height/2;
            position();
        } 

        // overrides move -> set costom center position (middle of the ellipse)
        void move(float _centerX, float _centerY) {
            centerX = _centerX;
            centerY = _centerY;
            position();
        } 

        // calculates particle positions 
        void position() {
            if (lerpValue >= 1) {
                // radius = square root (random(maxsize)); use sqrt for an even distribution
                float radius = sqrt(random(partBorder));
                // set random angles/positions, make a circle (TWO_PI)
                float angle = random(TWO_PI);
                // set previous position
                prevX = nextX;
                prevY = nextY;
                // set new position
                nextX = centerX + cos(angle) * radius;
                nextY = centerY + sin(angle) * radius;

                // set lerpSpeed -> distance between prevpos (x,y) & nextpos (x,y) * 0.0002
                lerpSpeed = calculateDist() * 0.0008;
                // reset lerp values
                lerpValue = 0;
                newAlpha = false;
            }
            else {
                currX = lerp(prevX, nextX, lerpValue);
                currY = lerp(prevY, nextY, lerpValue);
                lerpValue += lerpSpeed;
                if (newAlpha == false) {  
                    partAlpha += 1;
                    if (partAlpha >= maxPartAlhpa) {
                        newAlpha = true;
                    }
                }
                else if (partAlpha >= 10) {
                    partAlpha -= 8;
                }
            }
        }

        // calculate distance between prev position and next position
        float calculateDist() {
            float dx = prevX - nextX;
            float dy = prevY - nextY;
            float distance = sqrt(dx*dx + dy*dy);
            return distance;
        }
        
        public void draw() {
            if (localCounter < particleNumber - 1) {   
                localCounter++;
                currX = centerX + (int)random(-8 * lerpSpeed, 8 * lerpSpeed);
                currY = centerY + (int)random(0, width);
                display();
                centerX = currX;
                centerY = currY;
            }
            if (localCounter >= particleNumber) {
                finishCount++;
                localCounter = 0;
            }
        }
    }
}

/**
 * Plasma Demo Effect
 * by luis2048. 
 * extended bobcgausa
 * Cycles of changing colours warped to give an illusion 
 * of liquid, organic movement.Colors are the sum of sine 
 * functions and various formulas. Based on formula by Robert Klep. 
 */
 class EffectPlasma extends Effect {
   final int pixelSize=2;
   EffectPlasma(int width, int height) {super(width,height);}
   PImage end(boolean complement) {
    pg.colorMode(HSB,255);
    float  xc = 25;
    final float calculation1 = sin( radians(frameCount * 0.61655617));
    final float calculation2 = sin( radians(frameCount * -3.6352262));
      // Plasma algorithm
  for (int x = 0; x < pg.width; x++, xc += pixelSize)
  {
    float  yc    = 25;
    float s1 = 21 * sin(radians(xc) * calculation1 );
    int z=0;
    for (int y = 0; y < pg.height; y++, yc += pixelSize)
    {
      float s2 = 21 * sin(radians(yc) * calculation2 );
      float s3 = 21 * sin(radians((xc + yc + frameCount * 5) / 2));  
      float s  = (s1+ s2 + s3 + 64);
      if (pg.pixels[x+z]!=0xff000000 ^ complement)
      pg.pixels[x+z] = color(s+s, 255 - s, 255);
      else if (!complement) pg.pixels[x+z]=0;
      z+=pg.width;
    }
  }   
  pg.updatePixels();
  pg.endDraw();
  pg.popStyle();
  return pg;
  }
}
class EffectSpray extends Effect {
    int rgb, fill, stroke, blur;
    boolean fillb, strokeb;
    EffectSpray(int width, int height) {
        super(width, height);
    }
    void begin(color c1, int blurSize) {
        blur=blurSize;
        pg.beginDraw();
        pg.loadPixels();
        pg.background(255, 255, 255, 0);
        pg.pushStyle();
        pg.noSmooth();
        rgb=c1;
    }
    @Override
        void rect(int x, int y, int width, int height) {
        pg.fill(rgb>>16, (rgb>>8)&0xff, rgb&0xff);
        pg.rect(x, y, width, height);
        pg.filter(BLUR, blur);
        if (!strokeb) pg.noStroke();
        else pg.stroke(stroke>>16, (stroke>>8)&0xff, stroke&0xff);
        if (!fillb) pg.noFill();
        else pg.fill(fill>>16, (fill>>8)&0xff, fill&0xff);
        pg.rect(x, y, width, height);
    }
    PImage end() {
        /*for (int i=0; i<width*height; i++) {
         if (pg.pixels[i]==0xffffffff) pg.pixels[i]=0;
         }*/
        pg.updatePixels();
        pg.endDraw();
        pg.popStyle();
        return pg;
    }
    PImage end(boolean ignored) { 
        return end();
    }
    @Override
        void fill(int rgb) {
        fillb=true;
        fill=rgb;
    }
    @Override
        void stroke(int rgb) {
        strokeb=true; 
        stroke=rgb;
    }
    @Override
        void background(int rgb) {
        pg.background(rgb>>16, (rgb>>8)&0xff, rgb&0xff);
    }
    @Override
        void noFill() {
        fillb=false;
    }
    @Override
        void noStroke() {
        strokeb=false;
    }
    @Override
        void text(String s, int x, int y) {
            pg.colorMode(RGB, 0xff);
        pg.fill(rgb>>16, (rgb>>8)&0xff, rgb&0xff);
        pg.text(s, x, y);
        pg.filter(BLUR, blur);
        if (!strokeb) 
            pg.noStroke();
        else 
            pg.stroke(stroke>>16, (stroke>>8)&0xff, stroke&0xff);
        if (!fillb) 
            pg.noFill();
        else 
            pg.fill(fill>>16, (fill>>8)&0xff, fill&0xff); 
        pg.text(s, x, y);
    }
    @Override
        void ellipse(int x, int y, int w, int h) {
        pg.fill(rgb>>16, (rgb>>8)&0xff, rgb&0xff);
        pg.ellipse(x, y, width, height);
        pg.filter(BLUR, blur);
        if (!strokeb) pg.noStroke();
        else pg.stroke(stroke>>16, (stroke>>8)&0xff, stroke&0xff);
        if (!fillb) pg.noFill();
        else pg.fill(fill>>16, (fill>>8)&0xff, fill&0xff);
        pg.ellipse(x, y, width, height);
    }
}



