
//int radius = 80
//float b = 110;
//float speed = 0.5;
//int direction=1;
//int xPos=100;
//int yPos=50;
//int bSize=30;
void setup(){
  
  size(800,800);
  smooth();
  line(0,0,width,height);
  line(width,0,0,height);
  ellipse(width/2, height/2, 200,200);
    strokeWeight(5);
  for( int i = 310; i<475; i += 20){
    line(i, 380, i+20, 420);
    for( int k = 490; k>315; k -= 20){
    line(k, 380, k-20, 420);
    
//     fill(255,0,0);
 // rect(xPos,yPos,bSize,bSize);
    
    //ellipseMode(RRADIUS);
  }
  }
        noStroke();
    for( int y = 0; y<= height; y += 40){
      for( int x = 0; x <= width; x +=40){
        fill(232,211,211,160);
        ellipse(x,y,40,40);
      }
    }
    

}

void draw(){
 // x += speed * direction;
stroke(255,198,252,50);
line(400,400,mouseX,mouseY);
stroke(198,255,250,50);
float mx = mouseX + 60;
line(400,400,mx,mouseY);

if (mousePressed && (mouseButton == LEFT)) {
  stroke(255,0,0);
  
    strokeWeight(10);
    line(pmouseX,pmouseY,mouseX,mouseY);
    
} else if (mousePressed && (mouseButton == RIGHT)) {
  stroke(0,0,255);
  
    strokeWeight(10);
    line(pmouseX,pmouseY,mouseX,mouseY);
  //if(mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos && mouseY < yPos+bSize){
   // stroke(255,0,0);
    //strokeWeight(10);
    //line(pmouseX,pmouseY,mouseX,mouseY);
  //}
  //b += speed*direction;
  //if ((b>width-radius)||(b<radius)){
    //direction = -direction;
  //}
  //if (direction ==1){
    //arc(b,400,radius,radius, radians(30),radians(300));
  //}else{
    //arc(b,400,tadius,radius,radians(210),radians(480));
  //}
  
}
  
}
