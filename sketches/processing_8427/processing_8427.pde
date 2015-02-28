
int bg;
   //int f= millis();
void setup(){
  bg=(255);
  size(120,800);
   background(bg);
   smooth();
}
  
void draw() {
//fill(mouseX,mouseY,50,50);
//ellipse(mouseX,mouseY,mouseX*0.1,mouseX*0.1);
  int j= millis()%60;
  int g= (millis()/10)%60;
  int f= (millis()/100)%60;
  int s = second();  //秒數變數0~59
  int m = minute();  //分數變數0~59
  int h = hour();   //小時數變數0~23
  int q = day();
  int w = month();
  int e = year()%60;
  background(255,255,255);
  //background(255-h*3,s*3,m*3);
   strokeWeight(3);   //測量線
  line(60, 0,60 , 800);  //測量線
  
  strokeWeight(1);
  line(j, 0, j, 50);
  line(120-j, 0, 120-j, 50);
  strokeWeight(1);
  line(g, 50, g, 100);
  line(120-g, 50,120- g, 100);
  
  strokeWeight(1);
  line(f, 100, f, 150);
  line(120-f, 100,120- f, 150);
  
  strokeWeight(2);
  line(s, 150, s, 225);
  line(120-s, 150,120- s, 225);
   strokeWeight(2);
  line(m, 225, m, 300);
  line(120-m, 225,120- m, 300);
  strokeWeight(3);
  line(h, 300, h, 400);
  line(120-h, 300, 120-h, 400);
  fill(50);
  
  
  strokeWeight(3);      //day
  line(q*4, 400, q*4, 500);
  
  strokeWeight(3);      //month
  line(w, 500, w, 600);
  line(120-w, 500, 120-w, 600);
  
  strokeWeight(3);      //year
  line(e, 600, e, 700);
  line(120-e, 600, 120-e, 700);
  
  
  
  
  
 
    for(int x=0; x<=120 ; x=x+(width/25)){
      fill(10);
    strokeWeight(0.5);
    line(x,0,x,height);  //要+變數 不然沒效
  }

  }
  


