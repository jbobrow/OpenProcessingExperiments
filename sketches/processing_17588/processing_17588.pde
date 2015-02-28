
float x[] = {-50};
float y[] = {-50};

void setup(){
 size(500, 500);
 smooth();
 colorMode(HSB, 100);
}

void draw(){
 background(90);
 //時計（仮）
 textAlign(CENTER);
 textSize(32);
 fill(0);
 text("10:10:35", width/2, height/2);
 //雪
 x = append(x, random(width));
 y = append(y, random(height));
 for (int i = 0; i < x.length; i++) {
   //print(x[i] + ", ");
   fill(100);
   //noStroke();
   ellipse(x[i], y[i], 20, 20);
 }
 //println(" ");
 //noLoop();
}
                                
