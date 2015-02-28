
int x1 =200;
int y1 =200;
int B1=100;



void setup() {
  size (400, 400);
  background (21, 22, 49); 
  noStroke();
  smooth();
  fill(168, 173, 252);
}

void draw() {


  //   if(mouseX==pmouseX){
  //   ellipse( x1,y1,B1,B1);
  //   }

  if (dist(mouseX, mouseY, x1, y1) < 50) {
    ellipse( x1, y1, B1, B1);
    B1 += 1;
    if (B1 >= 300){
    
      B1=300;
    
    }
  }

  if (dist(mouseX, mouseY, x1, y1) >= 50) { 
        
    fill(21, 22, 49, 50);
    rect(0, 0, 400, 400); 
     fill(168, 173, 252);
    ellipse( x1, y1, B1, B1); 
    B1-= 1;
    if(B1<=10){
  B1= 10;}
  }
  
  //the commented part made the same, but in a more complicated way i guess...

  //   if(mouseX<width/2){
  //   if(mouseX<=pmouseX){ 
  //     
  //     fill(21,22,49,50);
  //rect(0,0,400,400); 
  //fill(168,173,252);
  //ellipse( x1,y1,B1,B1);
  //B1=B1-1;
  //if(B1<=10){
  //  B1= 10;}
  //     }else{
  //fill(21,22,49,50);
  //rect(0,0,400,400);
  //fill(168,173,252);
  //ellipse(x1,y1,B1,B1);
  //B1=B1+2;
  //if(B1<=10){
  //  B1= 10;}
  //}}
  //
  //if(mouseX>width/2){
  //  if(mouseX>=pmouseX){
  //   
  //     fill(21,22,49,50);
  //rect(0,0,400,400); 
  //fill(168,173,252);
  //ellipse( x1,y1,B1,B1);
  //B1=B1-1;
  //
  //if(B1<=10){
  //  B1= 10;}
  //  
  //     }else{
  //fill(21,22,49);
  //rect(0,0,400,400);
  //fill(168,173,252);
  //ellipse(x1,y1,B1,B1);
  //B1=B1+2;
  //}
  //if(B1<=10){
  //  B1= 10;}



//  if((mouseX >= x1-50) && (mouseX<=x1+50)){
//    if((mouseY>=y1-50)&&(mouseY <=y1+50)){
//   
//   noStroke();
//fill(21,22,49,50);
//rect(0,0,400,400);
//fill(168,173,252);
//    ellipse (200,200, mouseY,mouseY);
//  
//    }
//  }else{
//     ellipse( x1, y1, 50,50);
//  }
}


