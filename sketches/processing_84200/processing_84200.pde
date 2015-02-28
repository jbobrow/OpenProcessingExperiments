
void setup (){
  size(600,600);
  smooth();
}



void draw ()
{
//background(random(0,250),random(0,250),random(0,250));
fill(random(0,250));
strokeWeight(2);
triangle(random(300,300),random(200,500),random(200,500),random(200,500),random(200,300),random(200,500));

stroke(random(0,250));

}
