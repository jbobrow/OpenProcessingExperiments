
//TAYLOR SAVVY
// SWIRLY
// MATH @ SFAI - Nick Lally


float a = 0.0;
float ax = 400;
float ay = 400;
float dx = 450;
float dy = 400;
float rSize;  //
int additionElements;


void setup() {
  size(900, 800, P3D);
  rSize = width / 6;  
  background(0);
  
}

void draw() {
  
  background(0);
      a += 0.004f;
      ax+= 0.008f; 
//         println(a);
  pushMatrix();

  strokeWeight(.4);
        translate(width/2,height/2);
        for(int i =0; i<additionElements; i++){
             fill(80,40,220,10);
          ellipse(dx,dy,ax,ay);
            
          //dot elements  
          fill(255);
          ellipse(i+mouseX/3,mouseY+i+ay,2,2);
          ellipse(i+10+ax,mouseY+i,1,1);
          ellipse(i+100+ax,mouseY+i+50,1,1);
          ellipse(100+ax-i,40+ay/i,3,3);
          ellipse(200+ax-i,40+ay/i,2,2);
          stroke(90,i+30,255);
          rotate(radians(a+i));
          line(i-rSize,i/rSize,mouseX,mouseY);
          noFill();
         beginShape();
         vertex(i-rSize,i/rSize);
         vertex(100,100);
         vertex(i+rSize,i*rSize);
         vertex(mouseX,mouseY);
         endShape();
         ellipse(i+rSize+200,i/rSize,400-i,400-i);
          stroke(30+i++,i++,80+i++);
          line(i+rSize,i/rSize,800,800);
          arc(i+rSize,i+rSize,mouseX*rSize,mouseY-rSize,400,900);
          noStroke();
          fill(255);
          imageMode(CENTER);
          ellipse(0,0,10,10);
        }
                               popMatrix();


}

        void keyPressed(){
          additionElements++;
          println(additionElements);
        }
void mouseReleased(){
  additionElements += 10;
}

