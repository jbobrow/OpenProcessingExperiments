
//typeofdata name
 

//cant use part of the processing language, cant use spaces or special characters

//int life = 100; //stores inside a box, the number 100, life is the title of the box

/*
println(life);
life = life - 20;
println(life);
life += 20;
println(life);
*/

smooth();
size(700, 700);
noStroke();

for (int y=0; y<700; y+=10) {
  for (int x=10; x<700; x+=10) {
    //statements
    fill(x,y,125,50);
   ellipse(x+y/2, y+x/20, 30+x/2,40);
  }
}

