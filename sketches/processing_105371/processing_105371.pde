
 /* You plays a fry trying to get out of in & out to not get eaten 
so you control him to get him out
*/
PImage inout;
int help = 0;
int x = 550;
int y = 200;
//int []X1LH = new int[6];
void setup() {
inout = loadImage("in-n-out-burger.jpg");
background(0);
size(1100, 600);

}
void draw(){  
  
 if(help == 0){
textSize(22);
fill(255);
fill(255, 255, 0);
text("Frying", 400, 50 );
textSize(12);
text(" V 0.1 ALPHA", 400, 80);
textSize(22);
text("||", 510, 45);
fill(224, 20, 20);
text("\\_/", 500, 50);
textSize(10);
fill(255);
text("Creater and Coder . . . Anthony Mason", 550, 50);
text("For friends.", 550, 70);
text("Made on Processing", 550, 90);
textSize(15);
text("In the game 'Frying' you have to get out of the ", 400, 150);
text("kitchen and out of Shake & Bake fast food resturant",400, 170);
text("by going to the bathroom which will be green.", 400, 190);
text(" You need to get through the maze of potatos that will", 400, 210);
text("kill you and walls that will block you from getting to", 400, 230);
text("your goal. Some of the edges will kill you becasue ",400, 250);
text("there is a human hiding in there so try not to touch", 400, 270);
text("any thing.", 400, 290);
text("These are the basics UP = w or ^ keys, DOWN = s or", 400, 310);
text("v keys, LEFT = a or < keys, RIGHT = d or > keys.", 400, 330);
text("If you have any problems with the game you should",400, 350);
text("contact me at at my work email ninethdegree@gmail.com,",400, 370);
text("I also have a google plus so go on that and like me ",400, 390);
text("or do whatever you do on google plus.", 400, 410);
text("Thanks for playing",500, 430);
text(":)", 550, 450);
textSize(12);
fill(255);
text("Press mouse to start", 500, 550);
if (mousePressed){
  help++;
}
  }
if(mousePressed){
  inout.resize(1100, 600);
  image(inout, 0, 0);
  fill(255, 202, 88);
  rect(x, y, 5, 30);
  textSize(25);
  fill(255, 0, 0);
  text("Exit", 1050, 150);
  fill(170, 136, 64);
    strokeWeight(5);
  line(1000, 165, 1100, 165);
  line(1000, 300, 1000, 165);
  line(600, 300, 1000, 300);
  line(600,0, 600, 300);
  line(600, 300, 100, 300);
  line(100, 300, 100, 380);
  line(100, 380, 800, 380);
  line(800, 380, 800, 450);
  line(800, 450, 850, 450);
  line(0, 550, 850, 550);
  strokeWeight(1);
  ellipse(750, 490, 80, 110);
  ellipse(400, 450, 80, 110);
}
  if(keyPressed == true){
    image(inout, 0, 0);
    background(0);
      fill(170, 136, 64);
        strokeWeight(5);
        line(1000, 165, 1100, 165);
  line(1000, 300, 1000, 165);
  line(600, 300, 1000, 300);
  line(600,0, 600, 300);
  line(600, 300, 100, 300);
  line(100, 300, 100, 380);
  line(100, 380, 800, 380);
  line(800, 380, 800, 450);
  line(800, 450, 850, 450);
  line(0, 550, 850, 550);
  strokeWeight(1);
  ellipse(750, 490, 80, 110);
  ellipse(400, 450, 80, 110);
    if(key == 'w' || key == 'W' || keyCode == 38){
      image(inout, 0, 0);
  fill(255, 202, 88);
  rect( x, y--, 5, 30);
    textSize(25);
  fill(255, 0, 0);
  text("Exit", 1050, 150);
    strokeWeight(5);
    fill(170, 136, 64);
      line(1000, 165, 1100, 165);
  line(1000, 300, 1000, 165);
  line(600, 300, 1000, 300);
  line(600,0, 600, 300);
  line(600, 300, 100, 300);
  line(100, 300, 100, 380);
  line(100, 380, 800, 380);
  line(800, 380, 800, 450);
  line(800, 450, 850, 450);
  line(0, 550, 850, 550);
  strokeWeight(1);
  ellipse(400, 450, 80, 110);
  ellipse(750, 490, 80, 110);
  }else if(key == 'a' || key == 'A' || keyCode == 37){
    image(inout, 0, 0);
  fill(255, 202, 88);
  rect(x--, y, 5, 30);
    textSize(25);
  fill(255, 0, 0);
  text("Exit", 1050, 150);
    fill(170, 136, 64);
      strokeWeight(5);
      line(1000, 165, 1100, 165);
  line(1000, 300, 1000, 165);
  line(600, 300, 1000, 300);
  line(600,0, 600, 300);
  line(600, 300, 100, 300);
  line(100, 300, 100, 380);
  line(100, 380, 800, 380);
  line(800, 380, 800, 450);
  line(800, 450, 850, 450);
  line(0, 550, 850, 550);
  strokeWeight(1);
  ellipse(400, 450, 80, 110);
  ellipse(750, 490, 80, 110);
  }else if(key == 's' || key == 'S' || keyCode == 40){
    image(inout, 0, 0);
  fill(255, 202, 88);
  rect(x, y++, 5, 30);
    textSize(25);
  fill(255, 0, 0);
  text("Exit", 1050, 150);
    fill(170, 136, 64);
      strokeWeight(5);
      line(1000, 165, 1100, 165);
  line(1000, 300, 1000, 165);
  line(600, 300, 1000, 300);
  line(600,0, 600, 300);
  line(600, 300, 100, 300);
  line(100, 300, 100, 380);
  line(100, 380, 800, 380);
  line(800, 380, 800, 450);
  line(800, 450, 850, 450);
  line(0, 550, 850, 550);
  strokeWeight(1);
  ellipse(400, 450, 80, 110);
  ellipse(750, 490, 80, 110);
  }else if(key == 'd' || key == 'D' || keyCode == 39){
    image(inout, 0, 0);  
  fill(255, 202, 88);
  rect(x++, y, 5, 30);
    textSize(25);
  fill(255, 0, 0);
  text("Exit", 1050, 150);
    fill(170, 136, 64);
      strokeWeight(5);
    line(1000, 165, 1100, 165);
  line(1000, 300, 1000, 165);
  line(600, 300, 1000, 300);
  line(600,0, 600, 300);
  line(600, 300, 100, 300);
  line(100, 300, 100, 380);
  line(100, 380, 800, 380);
  line(800, 380, 800, 450);
  line(800, 450, 850, 450);
  line(0, 550, 850, 550);
  strokeWeight(1);
  ellipse(400, 450, 80, 110);
  ellipse(750, 490, 80, 110);
  }
  if(x>1000-25 && x>1000+25&& y>200-100 && y<200+100){
  
  background(0);
  fill(random(255), random(255), random(255));
  textSize(22);
  text("You Win!!",450, 300);
  text("refresh the screen to play again! :)", 420, 320);
  }
  if(x>400-40 && x<400+40&& y>450-65 && y<450+65){
  
  background(0);
  fill(255, 0,0);
  textSize(22);
  text("You Lost!!",450, 300);
  text("refresh the screen to play again! :)", 420, 320);
  }
  if(x>750-40 && x<750+40&& y>490-65 && y<490+65){
  
  background(0);
  fill(255, 0, 0);
  textSize(22);
  text("You Lost!!",450, 300);
  text("refresh the screen to play again! :)", 420, 320);
  }
  }
}


