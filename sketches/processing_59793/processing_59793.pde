
void setup(){
  
  smooth();

  size(400,400);  
  background(157,255,208);
  
}

void draw(){
  
 noStroke();
fill(86,255,15,100);
//erste reihe
triangle(0,50,25,0,50,50);
triangle(100,50,125,0,150,50);
triangle(200,50,225,0,250,50);
triangle(300,50,325,0,350,50);

triangle(50,0,75,50,100,0);
triangle(150,0,175,50,200,0);
triangle(250,0,275,50,300,0);
triangle(350,0,375,50,400,0);

//zweite reihe
triangle(0,75,25,125,50,75);
triangle(100,75,125,125,150,75);
triangle(200,75,225,125,250,75);
triangle(300,75,325,125,350,75);

triangle(50,125,75,75,100,125);
triangle(150,125,175,75,200,125);
triangle(250,125,275,75,300,125);
triangle(350,125,375,75,400,125);

//dritte reihe

triangle(0,200,25,150,50,200);
triangle(100,200,125,150,150,200);
triangle(200,200,225,150,250,200);
triangle(300,200,325,150,350,200);

triangle(50,150,75,200,100,150);
triangle(150,150,175,200,200,150);
triangle(250,150,275,200,300,150);
triangle(350,150,375,200,400,150);

//vierte reihe

triangle(0,225,25,275,50,225);
triangle(100,225,125,275,150,225);
triangle(200,225,225,275,250,225);
triangle(300,225,325,275,350,225);

triangle(50,275,75,225,100,275);
triangle(150,275,175,225,200,275);
triangle(250,275,275,225,300,275);
triangle(350,275,375,225,400,275);

//fünfte reihe

triangle(50,300,75,350,100,300);
triangle(150,300,175,350,200,300);
triangle(250,300,275,350,300,300);
triangle(350,300,375,350,400,300);

//erste reihe

/*fill(3,38,255,100);
ellipse(25,62.5,10,10);
ellipse(50,62.5,10,10);
ellipse(75,62.5,10,10);
ellipse(100,62.5,10,10);
ellipse(125,62.5,10,10);
ellipse(150,62.5,10,10);
ellipse(175,62.5,50,50);
ellipse(200,62.5,10,10);
ellipse(225,62.5,10,10);
ellipse(250,62.5,10,10);
ellipse(275,62.5,5,5);
ellipse(300,62.5,10,10);
ellipse(325,62.5,10,10);
ellipse(350,62.5,10,10);
ellipse(375,62.5,10,10);
ellipse(400,62.5,10,10);
*/

fill(3,38,255,50);

//erste reihe
ellipse(50,340,60,60);
ellipse(100,62.5,10,10);
ellipse(150,40,60,60);
ellipse(200,62.5,10,10);
ellipse(250,40,60,60);
ellipse(300,62.5,10,10);
ellipse(350,40,60,60);

//zweite reihe
ellipse(50,140,60,60);
ellipse(100,162.5,10,10);
ellipse(150,140,60,60);
ellipse(200,162.5,10,10);
ellipse(250,140,60,60);
ellipse(300,162.5,10,10);
ellipse(350,140,60,60);

//dritte reihe
ellipse(50,240,60,60);
ellipse(100,262.5,10,10);
ellipse(150,240,60,60);
ellipse(200,262.5,10,10);
ellipse(250,240,60,60);
ellipse(300,262.5,10,10);
ellipse(350,240,60,60);


}
