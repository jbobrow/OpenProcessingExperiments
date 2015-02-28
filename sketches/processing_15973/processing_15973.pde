
int a, b;




  void setup(){
size(600,600);
a= 190;
b= 210;
  }

void draw(){
background(255);
smooth();
ci(400, 0, 100,100);
ci(200, 150, 200, 50);

}
void ci(int c, int v, int g, int s ){

  pushMatrix();
  translate(g,s);
noStroke();

fill(v);
quad(a, 0, a+4, 0, a+5, c, a-1, c);
quad(b, 0, b+4, 0, b+5, c, b-1, c);
popMatrix();

pushMatrix();
translate(g,s);

fill(v);
quad(a, 0, a+4, 0, a+5, c, a-1, c);
quad(b, 0, b+4, 0, b+5, c, b-1, c);

popMatrix();
}



