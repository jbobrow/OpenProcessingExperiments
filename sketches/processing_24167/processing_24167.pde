
void setup(){
size(800,450);
smooth();
noLoop();
}

void draw(){
background(0,70,100);

for (int rep=0; rep<width; rep+=60)
{ 
  for (int i=0; i<=height+10; i+=10) {
    for (int j=0; j<=40; j+=10) {
      strokeWeight(2);
      stroke(round(255-i*255/height/2),180);
      if (j==0) {
        line(j+rep,i,j+rep+10,i-10);
      }
      else if (j==40) { 
        line(j+rep,i-10,j+rep+10,i);
      }
      if ((i%50)==0 && rep==0) { 
        strokeWeight(random(15));
        stroke(200,random(10,200)); 
        noFill();
        bezier(-10,i,i,i*random(2,3),width-i,i*random(2,3)-height,width+10,i);
      }
    }
  }

  strokeWeight(6+random(-5,5));
  stroke(0,70,100,100);
  line(rep+20,0,rep+20,height);
  line(rep+30,0,rep+30,height);
  fill(random(150,250),random(20,100),random(10,20),70);
  noStroke();
  if ((width/(rep+1))>3.5){
  quad(random(-width,round(width*2)),random(-height,round(height*2)),random(-width,round(width*2)),random(-height,round(height*2)),random(-width,round(width*2)),random(-height,round(height*2)),random(-width,round(width*2)),random(-height,round(height*2)));
  }
 noFill();
} 

}

void mousePressed(){
  redraw();
}         
                                
