
float tras = 2.0;
PGraphics frame;
float rx = 0;
float ry = 0;
float ra = 0;
float rb = 0;
float z = 100;

int inter = 0;

int a=0;
int b=0;
int c=0;
 
void setup(){
    size(800,450,P3D);
    fill(0);
    frameRate(30);
    noStroke();
    loadPixels();
    noCursor();
 
    frame = createGraphics(width+20,height+20,P2D);
    frame.beginDraw();
 
    frame.stroke(0,120);
    frame.noFill();
    frame.strokeWeight(20);
 
    frame.stroke(0,40);
    frame.rect(0,0,width,height);
    frame.filter(BLUR,10);
 
    frame.stroke(0,120);
    frame.rect(0,0,width,height);
    frame.filter(BLUR,2);
 
    frame.endDraw();
 
    smooth();
    
}
 
 
void draw(){
    background(255);
    pre();
    post();
      if (inter==0){
    a=255; b=255; c=255;
    }
    if (inter==1){
    a=0; b=0; c=0;
    }
    
   if (inter>=2){
     inter=0;
     
   }
    rx = map(mouseX, 0,width,-PI,PI);
    ry = map(mouseY, 0,height,-PI,PI);
    ra = map(mouseX, 0,height,-8,14);
    rb = map(mouseY, 0,width,-3,9);

  translate(width/2,height/2,z+170);
  rotateX(rx);
  rotateY(ry);
  noStroke();
  fill(0);
  box(0);
  
  
  translate(10,20,38);
  rotateX(rx);
  rotateY(ry);
  noStroke();
  fill(random(a),random(b),random(c),85);
  box(10);
  
 
  translate(7,12,30);
  rotateX(ra);
  rotateY(rb);
  noStroke();
  fill(random(a),random(b),random(c),85);
  box(14);
  
  translate(13,14,20);
  rotateX(400);
  rotateY(30);
  noStroke();
  fill(random(a),random(b),random(c),85);
  box(20);
  
  translate(14,17,12);
  rotateX(rx);
  rotateY(ry);
  noStroke();
  fill(random(a),random(b),random(c),85);
  box(7);
  
   translate(7,16,26);
  rotateX(ra);
  rotateY(rb);
  noStroke();
  fill(random(a),random(b),random(c),85);
  box(14);
  
   translate(18,4,30);
  rotateX(300);
  rotateY(40);
  noStroke();
  fill(random(a),random(b),random(c),85);
  box(19);
  
    translate(10,20,38);
  rotateX(rx);
  rotateY(ry);
  noStroke();
  fill(random(a),random(b),random(c),85);
  box(11);
  
  translate(7,12,30);
  rotateX(ra);
  rotateY(rb);
  noStroke();
  fill(random(a),random(b),random(c),85);
  box(14);
  
  translate(13,14,20);
  rotateX(400);
  rotateY(30);
  noStroke();
  fill(random(a),random(b),random(c),85);
  box(17);
  
  translate(14,17,12);
  rotateX(rx);
  rotateY(ry);
  noStroke();
  fill(random(a),random(b),random(c),85);
  box(13);
  
   translate(7,16,26);
  rotateX(ra);
  rotateY(rb);
  noStroke();
  fill(random(a),random(b),random(c),85);
  box(10);
  
   translate(18,4,30);
  rotateX(300);
  rotateY(40);
  noStroke();
  fill(random(a),random(b),random(c),85);
  box(14);
  
    translate(10,20,38);
  rotateX(rx);
  rotateY(ry);
  noStroke();
  fill(random(a),random(b),random(c),85);
  box(8);
  
  translate(7,12,30);
  rotateX(ra);
  rotateY(rb);
  noStroke();
  fill(random(a),random(b),random(c),85);
  box(12);
  
  translate(13,14,20);
  rotateX(400);
  rotateY(30);
  noStroke();
  fill(random(a),random(b),random(c),85);
  box(7);
  
  translate(14,17,12);
  rotateX(rx);
  rotateY(ry);
  noStroke();
  fill(random(a),random(b),random(c),85);
  box(16);
  
   translate(7,16,26);
  rotateX(ra);
  rotateY(rb);
  noStroke();
  fill(random(a),random(b),random(c),85);
  box(14);
  
   translate(18,4,30);
  rotateX(300);
  rotateY(40);
  noStroke();
  fill(random(a),random(b),random(c),85);
  box(10);
  
    translate(10,20,38);
  rotateX(rx);
  rotateY(ry);
  noStroke();
  fill(random(a),random(b),random(c),85);
  box(10);
  
  translate(7,12,30);
  rotateX(ra);
  rotateY(rb);
  noStroke();
  fill(random(a),random(b),random(c),85);
  box(13);
  
  translate(13,14,20);
  rotateX(400);
  rotateY(30);
  noStroke();
  fill(random(a),random(b),random(c),85);
  box(17);
  
  translate(14,17,12);
  rotateX(rx);
  rotateY(ry);
  noStroke();
  fill(random(a),random(b),random(c),85);
  box(12);
  
   translate(7,16,26);
  rotateX(ra);
  rotateY(rb);
  noStroke();
  fill(random(a),random(b),random(c),85);
  box(10);
  
   translate(18,4,30);
  rotateX(300);
  rotateY(40);
  noStroke();
  fill(random(a),random(b),random(c),85);
  box(15);
  
    translate(10,20,38);
  rotateX(rx);
  rotateY(ry);
  noStroke();
  fill(random(a),random(b),random(c),85);
  box(7);
  
  translate(7,12,30);
  rotateX(ra);
  rotateY(rb);
  noStroke();
  fill(random(a),random(b),random(c),85);
  box(16);
  
  translate(13,14,20);
  rotateX(400);
  rotateY(30);
  noStroke();
  fill(random(a),random(b),random(c),85);
  box(12);
  
  translate(14,17,12);
  rotateX(rx);
  rotateY(ry);
  noStroke();
  fill(random(a),random(b),random(c),85);
  box(17);
  
   translate(7,16,26);
  rotateX(ra);
  rotateY(rb);
  noStroke();
  fill(random(a),random(b),random(c),85);
  box(14);
  
   translate(18,4,30);
  rotateX(300);
  rotateY(40);
  noStroke();
  fill(random(a),random(b),random(c),85);
  box(10);
  
    translate(10,20,38);
  rotateX(rx);
  rotateY(ry);
  noStroke();
  fill(random(a),random(b),random(c),85);
  box(10);
  
  translate(7,12,30);
  rotateX(ra);
  rotateY(rb);
  noStroke();
  fill(random(a),random(b),random(c),85);
  box(10);
  
  translate(13,14,20);
  rotateX(400);
  rotateY(30);
  noStroke();
  fill(random(a),random(b),random(c),85);
  box(10);
  
  translate(14,17,12);
  rotateX(rx);
  rotateY(ry);
  noStroke();
  fill(random(a),random(b),random(c),85);
  box(10);
  
   translate(7,16,26);
  rotateX(ra);
  rotateY(rb);
  noStroke();
  fill(random(a),random(b),random(c),85);
  box(10);
  
   translate(18,4,30);
  rotateX(300);
  rotateY(40);
  noStroke();
  fill(random(a),random(b),random(c),85);
  box(10);
  
    translate(10,20,38);
  rotateX(rx);
  rotateY(ry);
  noStroke();
  fill(random(a),random(b),random(c),85);
  box(10);
  
  translate(7,12,30);
  rotateX(ra);
  rotateY(rb);
  noStroke();
  fill(random(a),random(b),random(c),85);
  box(10);
  
  translate(13,14,20);
  rotateX(400);
  rotateY(30);
  noStroke();
  fill(random(a),random(b),random(c),85);
  box(10);
  
  translate(14,17,12);
  rotateX(rx);
  rotateY(ry);
  noStroke();
  fill(random(a),random(b),random(c),85);
  box(10);
  
   translate(7,16,26);
  rotateX(ra);
  rotateY(rb);
  noStroke();
  fill(random(a),random(b),random(c),85);
  box(10);
  
   translate(18,4,30);
  rotateX(300);
  rotateY(40);
  noStroke();
  fill(random(a),random(b),random(c),85);
  box(10);

}
    
 
void pre(){
 
    beginShape(QUADS);
    fill(30+noise(frameCount/4.0)*50);
    vertex(0,0);
    vertex(width,0);
    fill(255);
    vertex(width,height);
    vertex(0,height);
    endShape(CLOSE);
 

    pushMatrix();
 
}
 
void post(){
 
     translate(random(2),random(2));
    for(int i =0;i<3;i++){
        stroke(0,100);
        line(width/4+noise(frameCount/200.0+i)*160+noise(frameCount/10.0+i)*6,0,width/4+noise(frameCount/200.0+i)*160+noise(frameCount/6.0+i)*10,height);
         }
          translate(random(2),random(2));
    for(int i =0;i<2;i++){
        stroke(0,100);
        line(550+noise(frameCount/200.0+i)*160+noise(frameCount/10.0+i)*6,0,550+noise(frameCount/200.0+i)*160+noise(frameCount/6.0+i)*10,height);
    }
     
    popMatrix();
 
    //resetMatrix();
    image(frame,-random(2),-random(2));
    for(int i =0;i<pixels.length;i++)
        pixels[i] = color(brightness(pixels[i])+random(-80,80));
    filter(BLUR,0.58);
 }
    
  
  void keyReleased(){
    
  if(key == 's'){
  saveFrame("enregister-####.tif");
  } }
  
 /*  void mousePressed(){
    if (mousePressed == true){
  a=256;
  b=256;
  c=256;
  } } */
  void mouseReleased(){
  
    inter = inter+1;
    
  
println(inter);
 }
   
   



 



