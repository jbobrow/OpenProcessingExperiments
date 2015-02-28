



PImage microbe_1_bw;
PImage microbe_2_bw;
PImage microbe_3_bw;
PImage microbe_4_bw;
PImage microbe_5_bw;
PImage microbe_6_bw;
PImage microbe_7_bw;
PImage microbe_10_bw;



void setup() {
  size(640, 480);
  smooth();
  colorMode(HSB, 360, 100, 100, 255);
  noCursor();
  frameRate(7);
  
  noLoop();
 
 microbe_3_bw = loadImage("microbe_3_bw.png");
 microbe_2_bw = loadImage("microbe_2_bw.png");
 microbe_1_bw = loadImage("microbe_1_bw.png");
 microbe_4_bw = loadImage("microbe_4_bw.png");
 microbe_5_bw = loadImage("microbe_5_bw.png");
 microbe_6_bw = loadImage("microbe_6_bw.png");
 microbe_7_bw = loadImage("microbe_7_bw.png");
 microbe_10_bw = loadImage("microbe_10_bw.png");

 
}

//click to reload, click on to reload frame by frame
 void mousePressed() {
   loop();
 
 }
 void mouseReleased(){
  noLoop(); 
 }
 
void draw() {

  
//random values
  
 //object attributes random values
 float ro = random(0, radians(360));  //random rotation
 float sc = random(0.25, 1.5); //random scale big
 float sc1 = random(0.25, 1.0); //random scale small
 float tr = random(100, 255); //random transparency
 float tr1 = random(175, 255); //random transparency darker
 float objH = random (0, 360); //random hue

 //background color random values
 float backH = random(45, 185); 
 float backS = random(5, 15);
 float backB = random(80, 85);
 
 background(backH, backS, backB);


 //for(int i = 0; i < 5; i ++) {
 //float num = int (random(0, 15));
 //if(num == 0) }
 //{else if(num == 1)}
 //{else if(num == 2)}
 //{else if(num == 3)}
 
//microbes
 
 //paramecium, microbe 10
 float x10 = random(microbe_10_bw.width/2, width-(microbe_10_bw.width/2));
 float y10 = random(microbe_10_bw.height/2, height-(microbe_10_bw.height/2));
 pushMatrix();
 translate(x10, y10);
 scale(sc+0.25);
 rotate(ro);
 tint(objH, 49, 85, tr1+20);
 image(microbe_10_bw, -microbe_10_bw.width/2, -microbe_10_bw.height/2);
 popMatrix();

 //tapeworm, microbe 3
 float x3 = random(width - x10); //inverse x to paramecium
 float y3 = random(height - y10); //inverse y to paramecium
 pushMatrix();
 translate(x3, y3);
 scale(1.0 - sc);
 rotate(ro-180);
 tint(objH-40, 49, 95, tr+30);
 image(microbe_3_bw, -microbe_3_bw.width/2, -microbe_3_bw.height/2);
 popMatrix();
 
 //avian flu, microbe 1
 float x1 = random(width - (x10+50)); //inverse + 50 to paramecium
 float y1 = random(height - y10); //inverse y to paramecium
 pushMatrix();
 translate(x1, y1);
 scale(sc-0.40);
 rotate(ro+60);
 tint(objH-70, 49, 85, tr1+50);
 image(microbe_1_bw, -microbe_1_bw.width/2, -microbe_1_bw.height/2);
 popMatrix();
 
 //spikey bacteria, microbe 2
float x2 = random(microbe_2_bw.width/2, width-(microbe_2_bw.width/2));
 float y2 = random(microbe_2_bw.height/2, height-(microbe_2_bw.height/2));
 pushMatrix();
 translate(x2, y2);
 scale(sc1);
 rotate(ro);
 tint(objH-100, 49, 75, tr+100);
 image(microbe_2_bw, -microbe_2_bw.width/2, -microbe_2_bw.height/2);
 popMatrix();
 
 //volvox, microbe 6
 float x6 = random(microbe_6_bw.width/2, width-(microbe_6_bw.width/2));
 float y6 = random(microbe_6_bw.height/2, height-(microbe_6_bw.height/2));
 pushMatrix();
 translate(x6, y6);
 scale(sc);
 rotate(ro);
 tint(objH, 49, 95, tr);
 image(microbe_6_bw, -microbe_6_bw.width/2, -microbe_6_bw.height/2);
 popMatrix();
 
 //enterococcus faecalis, microbe 4
 float x4 = random(microbe_4_bw.width/2, width-(microbe_4_bw.width/2));
 float y4 = random(microbe_4_bw.height/2, height-(microbe_4_bw.height/2));
 pushMatrix();
 translate(x4, y4);
 scale(sc1-0.25);
 rotate(ro);
 tint(objH+50, 49, 95, tr1);
 image(microbe_4_bw, -microbe_4_bw.width/2, -microbe_4_bw.height/2);
 popMatrix();
 
 //salmonellas, microbe 5 
  float x5 = random(microbe_5_bw.width/2, width-(microbe_5_bw.width/2));
 float y5 = random(microbe_5_bw.height/2, height-(microbe_5_bw.height/2));
 pushMatrix();
 translate(x5, y5);
 scale(sc);
 rotate(ro);
 tint(objH+70, 49, 95, tr1);
 image(microbe_5_bw, -microbe_5_bw.width/2, -microbe_5_bw.height/2);
 popMatrix();
 
  //flu virus, microbe 7 
 float x7 = random(microbe_7_bw.width/2, width-(microbe_7_bw.width/2));
 float y7 = random(microbe_7_bw.height/2, height-(microbe_7_bw.height/2));
 pushMatrix();
 translate(x7, y7);
 scale(sc1);
 rotate(ro);
 tint(objH+85, 49, 95, tr+100);
 image(microbe_7_bw, -microbe_7_bw.width/2, -microbe_7_bw.height/2);
 popMatrix();
 
 //line drawing options
 
 //option to draw connecting lines from flu virus
 if((keyPressed == true) && (key == '1')) {
 
 stroke(objH-70, 49, 85, tr1+50);
 
 line(x7, y7, x1, y1);
 line(x7, y7, x2, y2);
 line(x7, y7, x4, y4);
 line(x7, y7, x3, y3);
 line(x7, y7, x10, y10);
 line(x7, y7, x6, y6);
 
 }
 
 else {
 //option to draw connecting lines from volvox
 if((keyPressed == true) && (key == '2')) {
 //lines
 stroke(objH-70, 49, 85, tr1+50);
 line(x6, y6, x1, y1);
 line(x6, y6, x2, y2);
 line(x6, y6, x4, y4);
 line(x6, y6, x3, y3);
 line(x6, y6, x10, y10);
 line(x6, y6, x7, y7);

     }
     
 else {
 //option to draw connecting lines from tapeworm
 if((keyPressed == true) && (key == '3')) {
 //lines
 stroke(objH-70, 49, 85, tr1+50);
 line(x3, y3, x1, y1);
 line(x3, y3, x6, y6);
 line(x3, y3, x4, y4);
 line(x3, y3, x2, y2);
 line(x3, y3, x10, y10);
 line(x3, y3, x7, y7);
 
           }
         }
       }
     }



