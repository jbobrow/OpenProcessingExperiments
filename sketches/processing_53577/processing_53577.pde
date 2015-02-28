
//REPRESENETATIONAL
//MILTON SUKHABUT, EvilandCute face, PS_2
int btnx=320;
int btny=300;
int btnw=10;
int btnh=80;
boolean btnstate = false;

void setup(){
  size(500,500);
  smooth();
}

void draw (){
  strokeWeight(3);
  if (btnstate==true){
    background(0,185,255);
  }
  else{
    background(130);
  }
    fill(0);
  rect(btnx,btny,btnw,btnh);

   triangle(200, 260, 230, 110, 50, 85);
    fill(0);
    ellipse(300,200,80,80);
    ellipse(180,250,80,80);
   
    fill(0);
    triangle(75, 150, 300, 210, 260, 90); 
   
     
    
    rect(250, 335, 80, 10);
    rect(250, 300, 10, 80);
    rect(320, 300, 10, 80);
    rect(320, 335, 80, 10);
    rect(400, 300, 10, 80);

}
//CLICK THE MIDDLE RECTANGLE OF THE STITCHED MOUTH AND OUTSIDE OF IT FOR SURPRISE**
void mousePressed(){
 if(mouseX>btnx && mouseX < btnx + btnw && mouseY> btny && mouseY <btny + btnh){
  btnstate= true;
 }
else{
 btnstate = false;
}
}


