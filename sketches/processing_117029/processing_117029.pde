
PFont font1;
PFont font2,font3,font4;


//string p1="youngs";


int page =0;


void setup(){
  size(800,800);
  background(0);
  
  font1= loadFont("ARBONNIE-200.vlw");
  font2= loadFont("ARCHRISTY-200.vlw");
  font3= loadFont("Sylfaen-48.vlw");
  font4= createFont("cooper black",200);
  

}
void draw (){
  textAlign(CENTER, CENTER);

   if(page==0){   
   
  fill(104,73,180);
  textFont(font1,80);
  text("I Think I Can", width/2,height/2);
}else if(page==1){
  
  fill(241,49,89);
  textFont(font2,40);
  text("If you think you are beaten, you are;", width/2,180);

 }else if(page==2){
 
   fill(241,49,89);
  textFont(font3,40);
  text("If you want to win but think you can't;", width/2,480);
  }else if(page==3){


  fill(241,49,80);
  textFont(font4,30);
  text("If you think you dare not, you don't;", width/2,580);
}else if(page==4){

  background(255);
}
 }
