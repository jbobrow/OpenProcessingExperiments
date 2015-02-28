
float mx = 0.0;
float radioSol = 0.0;

float fondo = 0.0;
float petalo = 0.0;

void setup(){
   size(400, 400);
   cursor(HAND);
}

void draw(){
   background(170,193,255);
   fondo =map(mx,0,400,5,255);
   fill (fondo);
   rect(0,0,width,height-5);

   
   for(int i=0; i<400; i+=80) {
    stroke(39, 230, 13);
    noFill();
    strokeWeight(2);
    beginShape();
    vertex(i, 150+mx*0.5);
    bezierVertex(150, 210, 80+i, 400, i, 400);
    endShape();
    
    if((mx>0)&&(mx<400)){
       petalo = map (mx,10,400,0,400);
       noStroke();
    fill(22,134,227);
  ellipse(i+10*petalo/5,150+mx*0.5,15,8);
    ellipse(i-10,150+mx*0.5,15-mx*0.1,8);
    ellipse(i,140+mx*0.5,8,15-mx*0.1);
    ellipse(i,160+mx*0.5,8,15-mx*0.1);

   }
 
    fill(255,146,89);
    ellipse(i,150+mx*0.5,10,10);
    noFill();

   
}
for(int i=20; i<400; i+=80) {
    stroke(56, 234, 123);
    strokeWeight(3);
    beginShape();
    vertex(i, 100+mx*0.5);
    bezierVertex(100+i, 250, 80, 200, i, 400);
    endShape();
 if((mx>0)&(mx<200)){
       petalo = map (mx,0,400,0,400);
       noStroke();
    fill(22,134,227);
    ellipse(i+16*petalo/5,100+mx*0.5,20,8);
    ellipse(i-16,100+mx*0.5,20-mx*0.1,8);
    ellipse(i,116+mx*0.5,8,20-mx*0.1);
    ellipse(i,84+mx*0.5,8,20-mx*0.1);

   }
    fill(255,146,89);
    ellipse(i,100+mx*0.5,18,18);
    noFill();
   }
    radioSol = map(mx, 0, 400, 0, 200);
   fill(241,245,57);
   ellipse(0,0,radioSol+10,radioSol+10);

   float dif = mouseX - mx;
   if(abs(dif) > 1.0) {
     mx = mx + dif/16.0;
   }
   mx = constrain(mx, 1, width-1);
   noStroke();
   fill(40, 120, 34);
   rect(0, height-5, width, 5);
   fill(204, 102, 67);
   rect(mx-2, height-5, 4, 5);
}





