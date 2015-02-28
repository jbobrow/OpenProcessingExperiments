
frg refrigerator1;
frg refrigerator2;
frg refrigerator3;


void setup(){
size(800,200);
smooth();
refrigerator1 = new frg(random(55,235),random(20,35),random(30,60),random(85,105),random(255),random(255),random(255) );
refrigerator2 = new frg(random(300,500),random(20,35),random(30,60),random(85,105),random(255),random(255),random(255) );
refrigerator3 = new frg(random(565,705),random(20,35),random(30,60),random(85,105),random(255),random(255),random(255) );

}

void draw(){
  

background(255);
refrigerator1.display();
refrigerator1.openLeft();
refrigerator1.openTop();
refrigerator1.openBottom();

refrigerator2.display();
refrigerator2.openLeft();
refrigerator2.openTop();
refrigerator2.openBottom();


refrigerator3.display();
refrigerator3.openLeft();
refrigerator3.openTop();
refrigerator3.openBottom();
}
 
void mouseReleased() {
    setup();
  }
class frg {
  float p;
  float x;
  float y;
  float y0;
  float r;
  float g;
  float b;



  frg(float pos, float xk, float yk, float y0k, float rk, float gk, float bk) {
    p = pos;
    x =xk;
    y = yk;
    y0 = y0k;
    r = rk;
    g= gk;
    b = bk;
  }
  void display() {
    stroke(0);
    //refrigerator body
    fill(r, g, b);
    strokeWeight(2);
    rect(p, 50, 70, 100, 5);
    strokeWeight(1);

    //vertical door crack
    fill(0);
    rect(p+x, 50, 2, 100);

    //horizontal door crack
    rect(p+x, y+50, 70-x, 2);

    fill(255);

    //horizontal handle
    rect(p+5, y0, x-10, 3, 1);

    //vertical handle
    rect(p+x+8, y/2 +40, 3, 20);

    rect(p+x+8, y/2+90, 3, 20);
  }

  void openLeft() {    
    if (mouseX<=p+x && mouseX>=p && mouseY<=150 && mouseY>=50) {
      fill(255);
      strokeWeight(2);
      rect(p, 50, x, 100, 5, 0, 0, 5);
      rect(p-x-2, 50, x, 100, 0, 5, 5, 0);
      strokeWeight(1);
      rect(p, 70, x, 1);
      rect(p, 95, x, 1);
      rect(p, 120, x, 1);
      rect(p-x-2, y0-20, x, 1);

      fill(230);
      rect(p-x-2, y0+10, x, 150-y0-10, 0, 0, 5, 0);
    }
  }


  void openTop() {
    if (mouseX>=p+x && mouseX<=p+70 && mouseY<=y+50 && mouseY>=50) {
      fill(255);
      strokeWeight(2);
      rect(p+x, 50, 70-x, y, 0, 5, 0, 0);
      rect(p+72, 50, 70-x, y, 5, 0, 0, 0);
      strokeWeight(1);
      rect(p+x, y/2+55, 70-x, 1);


      fill(230);
      rect(p+72, y/2+50, 70- x, y/2, 0, 0, 0, 5);
    }
  }


  void openBottom() {
    if (mouseX>=p+x && mouseX<=p+70 && mouseY<=150 && mouseY>=50+y) {
      fill(255);
      strokeWeight(2);
      rect(p+x, 50+y, 70-x, 100-y, 0, 0, 5, 0);
      rect(p+72, 50+y, 70-x, 100-y, 0, 0, 0, 5);

      strokeWeight(1);
     
      rect(p+x, 2*y/3+83, 70-x, 1);
      rect(p+x, y/3+117, 70-x, 1);


      fill(230);
      rect(p+72, y/2+100, 70- x,50- y/2, 0, 0, 0, 5);
    }
  }
}












