
int i=1;
PFont font;
void setup(){
  size(500,140);
  
  println(PFont.list());//lista font installati nel pc
  
  //font= loadFont ("Aharoni-Bold-20.vlw");
  font=createFont ("Franklin Gothic Demi",32);
  textFont(font);
}
  
void draw(){  
  background(200);
  fill(255);
  textSize(32);
  text("Text",i+100,20,460,100);
  fill(0);
  //font size
  textSize(20);
  //interlinea
  text("Running",i,30,460,100);
  fill(230);
  //font size
  textSize(40);
  //interlinea
  text("/",i+75,15,460,100);
  if (i>=340){
    i=0;
  }
  i=i+1;
}


                
                
