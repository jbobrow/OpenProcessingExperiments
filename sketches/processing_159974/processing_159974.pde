
//light blue to purplish red
color[] cor1 = {#ABF0FF,#C1CCE8,#AF94FF,#CA52E8,#FF0E64}; 
//purplish blue, blue,light blue,light grey,red
color[] cor2 = {#4D3B74,#5375A2,#C6EBF1,#F1EEEA,#F24443};
//white red blue brown light brown
color[] cor3 = {#F5F3F4,#FD6D5C,#7DA6AD,#634E4C,#B2A086};
//red yellow red brown white
color[] cor4 = {#D74047,#F0D4A2,#D96A5C,#5C0303,#F5F3F4};
color[] palette = cor1;




int choice;
int p1 = 1;
int p2 = 2;
int p3 = 3;
int p4 = 4;
int p5 = 0;



float x;
float y;

void setup(){
size(600,600);

}

void draw(){
// while(x < 600){
   background(#BBBBBB);
   strokeWeight(5);
   noFill();
 
  //the rightmost ellipse
  stroke(palette[p1]);
  ellipse(x,y,80,80);
  
  //the right two ellipse
  stroke(palette[p2]);
  ellipse(x-30,y+50,80,80);
  ellipse(x-30,y-50,80,80);
  
  //the left two ellipse
  stroke(palette[p4]);
  ellipse(x-90,y+50,80,80);
  ellipse(x-90,y-50,80,80);
  
  //the left most ellipse
  stroke(palette[p5]);
  ellipse(x-120,y,80,80);
  
  //the middle one
  fill(palette[p3],99);
  stroke(255);
  ellipse(x-60,y,70,70);
  
  //the middle small one
  strokeWeight(5);
  stroke(palette[p4],99);
  ellipse(x-60,y,28,28);
  
  //if
  if (mouseX > width/2){
    x += 2;
   x = constrain(x,165,550);
  } 
  else{
    x -= 2;
     x = constrain(x,165,550);
  }
  if(mouseY > height/2){
   y += 2.5;
   y = constrain(y,95,500);
  }
   else{
    y -= 2.5;
    y = constrain(y,95,500);
   }
}

void keyPressed(){
  p1 = int(random(0,4));
  p2 = int(random(0,4));
  p3 = int(random(0,4));
  p4 = int(random(0,4));
  p5 = int(random(0,4));
  
  int choice = key;
  switch(choice){
     case 49:
      palette = cor1;
      break;
    case 50:
      palette = cor2;
      break;
    case 51:
      palette = cor3;
      break;
    case 52:
      palette = cor4;
      break;
    case 53:
      palette = cor1;
      break;
  }
}
    


















