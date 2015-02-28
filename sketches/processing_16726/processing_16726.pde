
Clock cl;

void setup() {
  size(600,400);
  smooth();
  cl = new Clock(width/2,height/2);
  imageMode(CENTER);
  
myImage1 = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/sunny.png");

 myImage2 = loadImage("https://sites.google.com:443/a/go.jindai.ac.jp/mathateken/uploads/cloudy.png?revision=1");

myImage3 = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/ranny.png");



}

void draw() {
  
 

    
  background(204);
  drawDiscus(width/2,height/2);
  //1時
  drawMessage(30,-120);
  //2時
  drawMessage(90,-90);
  //3時
  drawMessage(120,-30);
  //4時
  drawMessage(120,30);
  //5時
  drawMessage(90,90);
  //6時
  drawMessage(30,120);
  //7時
  drawMessage(-30,120);
  //8時
  drawMessage(-85,90);
  //9時
  drawMessage(-120,30);
  //10時
  drawMessage(-120,-30);
  //11時
  drawMessage(-85,-85);
  //12時
  drawMessage(-30,-120);
  
  cl.display()

}

  void drawDiscus(int x,int y){ 
    noStroke();
    fill(255,255,200);
    ellipse(x,y,300,300);
    stroke(0,50);
    translate(x,y);
    for (int i = 0; i < 12; i++) {
      strokeWeight(1);
      rotate(2*PI/12);
      line(0,0,0,-150);
      
      
    }
}


//天気表示
String[] Message =  {"sunny.png","cloudy.png","ranny.png"};


void drawMessage(int x, int y) {
  fill(random(100), 99, 99);
  textSize(10);
 // String message = Message[int("photo1")];
  //text("sunny.png",x,y);
  
  
  image(myImage1, x, y, 40, 40);
image(myImage2, x, y, 40, 40);
image(myImage3, x, y, 40, 40);

  
  
}



//Clockクラスを定義
class Clock {
  //属性を定義
  float x, y; 

  Clock(float _x, float _y) {
    x = _x;
    y = _y;
  }

  void display() {
    

    int s = second();
    int m = minute();
    int h = hour();

    stroke(0);

    //時針
    pushMatrix();

    strokeWeight(8);
    rotate(h * TWO_PI/12);
    line(0,0,0,-70);
    popMatrix();

    //分針
    pushMatrix();

    strokeWeight(4);
    rotate(m * TWO_PI/60);
    line(0,0,0,-120);
    popMatrix();

    //秒針
    /*
    pushMatrix();
    strokeWeight(1);
    rotate(s * TWO_PI/60);
    line(0,0,0,-150);
    popMatrix();
    */



    //周りの円
/*    pushMatrix();
    rotate(s * TWO_PI/60);
    noStroke();
    fill(255);
    translate(0,-250);
    for (int i = 0; i < 8; i++) {
      rotate(TWO_PI/8);
      translate(3,8);
      ellipse(0,0,30,20);
    }
    popMatrix();

*/


pushMatrix();
    //晴れ
    /*
    noStroke();
    fill(255,0,0);
    translate(-110,-120);
    ellipse(0,0,40,40);
    for (int i = 0; i < 8; i++) {
      stroke(255,0,0);
      rotate(TWO_PI/8);
      line(20,20,25,25);
    }*/
   
     popMatrix();

    //曇り
    /* noStroke();
     fill(255);
     translate(-50,-50);
     for (int i = 0; i < 8; i++) {
     
     translate(3,8);
     rotate(TWO_PI/8);
     ellipse(0,0,30,20);
     }
     */
  }
}


                                                                                                                                                                                                                                                                                                
