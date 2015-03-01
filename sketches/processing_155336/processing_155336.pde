

PImage back;
boolean[][] answer = {
  //no1
{true,true,false,true,true,false,true},
//no2
{true,false,false,false,false,true,false},
//no3
{true,false,false,false,true,false,false},
//no4
{false,true,true,false,true,false,true},
//no5
{false,false,true,false,true,false,false},
//no6
{false,false,true,false,false,false,false},
//no7
{true,false,false,true,true,false,true},
{false,false,false,true,true,false,true},
//no8
{false,false,false,false,false,false,false},
//no9
{false,false,false,false,true,false,false},
//no0
{false,false,false,true,false,false,false},



};

boolean[] flag = new boolean[7];

void setup(){
back = loadImage("back.png");
size(800,600);
background(back);
smooth();
noStroke();
flag[0] = true; 
flag[1] = true;
flag[2] = true;
flag[3] = true;
flag[4] = true;
flag[5] = true;
flag[6] = true;
}

void draw(){
   allow(240,150);
   
   for(int i =0; i< answer.length; i++){
     for(int j =0; j< answer[i].length;j++){
       if(flag[j] == answer[i][j]){
         
        circle();
       
       }else{
         miss();
       
       }
       
     
     }
   
   }
  }





    
    
void object(int x,int y){
    noStroke();
  pushMatrix();
  translate(x,y);
  beginShape();
  vertex(50,50);
  vertex(60,40);
  vertex(70,50);
  vertex(70,140);
  vertex(60,150);
  vertex(50,142);
  endShape(CLOSE);
  popMatrix();

}


void allow(int x,int y){
  pushMatrix();
  translate(x,y);
  fill(0);
  noStroke();
  
  beginShape();
  vertex(100,100);
  vertex(200,100);
  vertex(200,70);
  vertex(250,110);
  vertex(200,150);
  
  
  vertex(200,120);
  vertex(100,120);
  
  endShape(CLOSE);
  popMatrix();

}



void object2(int x,int y){
    noStroke();
  pushMatrix();
  translate(x,y);

  
  beginShape();
  vertex(77,27);
  vertex(65,37);
  vertex(77,48);
  vertex(154,48);
   vertex(167,37);
    vertex(154,27);
  
  endShape(CLOSE);
  popMatrix();

}

void mouseClicked(){
  if(mouseX>=160 && mouseX<=180 && mouseY>=160 && mouseY<=250){
    if(flag[0]){

      fill(255,0,17);
       object(110,110);
     flag[0] = false;

    
      }else{

     fill(170);
       object(110,110);
    flag[0] = true;

      }
  }
  
  
   if(mouseX>=180 && mouseX<=260 && mouseY>=137 && mouseY<=160){
    if(flag[1]){


      fill(255,0,17);
       object2(110,110);
      flag[1] = false;
      }else{


     fill(170);
     object2(110,110);
      flag[1] = true;
      }
  }
  
  if(mouseX>=272 && mouseX<=294 && mouseY>=161 && mouseY<=250){
    if(flag[2]){


      fill(255,0,17);
     object(222,110);
  flag[2] = false;
      }else{


     fill(170);
     object(222,110);
       flag[2] = true;
      }
  }
  
    if(mouseX>=180 && mouseX<=260 && mouseY>=254 && mouseY<=275){
    if(flag[3]){

      fill(255,0,17);
    object2(110,226);
      flag[3]=false;
      }else{


     fill(170);
   object2(110,226);
     flag[3]=true;
      }
  }
  
   if(mouseX>=160 && mouseX<=180 && mouseY>=270 && mouseY<=360){
    if(flag[4]){

      fill(255,0,17);
    object(110,225);
         flag[4]=false;
      }else{
      

     fill(170);
  object(110,225);
         flag[4]=true;
      }
  }
  
   if(mouseX>=272 && mouseX<=294 && mouseY>=270 && mouseY<=360){
    if(flag[5]){
     

      fill(255,0,17);
object(222,225);
         flag[5]=false;
           
      }else{
   

     fill(170);
object(222,225);
        flag[5]=true;
      }
  }
  
  if(mouseX>=180 && mouseX<=260 && mouseY>=368 && mouseY<=390){
    if(flag[6]){


      fill(255,0,17);
object2(110,340);
        flag[6]=false;
      }else{


     fill(170);
object2(110,340);
         flag[6]=true;
      }
  }
  
  
  
  
  
  
 
//correct();

}

void correct(){
  
//  if(flag[0] && flag[1] && !flag[2] && flag[3] && flag[4]&& !flag[5] &&flag[6]){
//    println("1");
//   circle();
//  }else if(flag[0] && !flag[1] && !flag[2] && !flag[3] && !flag[4]&& flag[5] &&!flag[6]){
//      println("2");
//       circle();
//    }else if(flag[0] && !flag[1] && !flag[2] && !flag[3] && flag[4]&&!flag[5] &&!flag[6]){
//      println("3");
//   circle();
//}else if(!flag[0] && flag[1] && !flag[2] && !flag[3] && flag[4]&&!flag[5] &&flag[6]){
//  println("4");
//circle();
//}else if(!flag[0] && !flag[1] && flag[2] && !flag[3] && flag[4]&&!flag[5] &&!flag[6]){
//    println("5");
//circle();
//}else if(!flag[0] && !flag[1] && flag[2] && !flag[3] && !flag[4]&&!flag[5] &&!flag[6]){
//    println("6");
//
//circle();
//}else if(!flag[0] && !flag[1] &&! flag[2] && flag[3] && flag[4]&&!flag[5] &&flag[6]){
//    println("7");
//  circle();
//
//
//}else if(flag[0] && !flag[1] &&! flag[2] && flag[3] && flag[4]&&!flag[5] &&flag[6]){
//    println("7");
// circle();
//
//}else if(!flag[0] && !flag[1] &&! flag[2] && !flag[3] && !flag[4]&&!flag[5] &&!flag[6]){
//    println("8");
//
// circle();
//}else if(!flag[0] && !flag[1] &&! flag[2] && !flag[3] && flag[4]&&!flag[5] &&!flag[6]){
//    println("9");
//
// circle();
//}else if(!flag[0] && !flag[1] &&! flag[2] && flag[3] && !flag[4]&&!flag[5] &&!flag[6]){
//  println("0");
// circle();
//}else{
//
//miss();
//}




}



void circle(){
     noFill();
  strokeWeight(30);
  stroke(255);
 line(526,185,690,350);
   line(690,185,526,350);
  
 noFill();
  strokeWeight(20);
  stroke(255,0,17);
   ellipse(610,270,100,100);
   }
   
   

void miss(){
   noFill();
  strokeWeight(30);
  stroke(255);
ellipse(610,270,100,100);
  strokeWeight(20);
  stroke(15,37,255);
  line(526,185,690,350);
   line(690,185,526,350);

}





