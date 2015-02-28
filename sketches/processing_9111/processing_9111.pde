
//loop test
//alex le guillou
//processingparis.ning.com


float r;
void setup(){
  size(800,600);  
} 

void draw(){
  fill(0,20);
  rect(0,0,width,height);
  stroke(33);
  translate(width/2, height/2);
  noStroke();
  rotate(r);
  //float(mouseX)/float(width); est un nombre entre 0 et 1
  float angle = 360* float(mouseX)/float(width);
  rotate(radians(angle));
  //rotate(radians(180)); //rotate(radians(45)) ou rotate (PI/3)
  for(int i=0;i<400;i++){
    fill(i/2,0,0);
    rotate(radians(360/50)*i);    
    rect(i*1.5,0,100-i,100-i);
    fill(i);
    ellipse(i*1.5,0,50-i,50-i);
  }
  r=r+0.005;

}
void keyPressed(){
  if(key == ' ')
  {
    println("saveFrame");
   // saveFrame("export-####.png");
  }
}




