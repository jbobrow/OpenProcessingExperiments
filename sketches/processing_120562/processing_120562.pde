
PFont logo;

//logo = loadFont("BodoniMTPosterCompressed-100.vlw");
size(400, 565);
background(255, 255, 255);

//back_syasen
noStroke();
fill(255, 0, 0);
quad(0, 0, 0, 100, width, 900, width, 260);

//togetoge
fill(255, 97, 36);
triangle(-80, 565, 50, height/2, 40, 565);

fill(0, 0, 0);
triangle(-50, 565, 150, 360, 70, 565);

fill(255, 97, 36);
triangle(350, 580, 280, height/3, 550, 555);

fill(0, 0, 0);
triangle(350, 580, 350, height/3, 450, 500);

fill(152, 152, 152);
triangle(350, 565, 260, height/2, 470, 565);

fill(0, 0, 0);
triangle(130, 565, 350, 400, 280, 565);

fill(152, 152, 152);
triangle(130, 565, 60, 330, 220, 565);

//filter
for(int x=0; x < height; x+=2){
  if(x > 100 && x < 300){
  stroke(255,255,255,100);
}
else{
  stroke(0,0,0,100);}
  line(x, x, 0, height);
  line(width,0,x,x);

}








//fill(0);
//textFont(logo, 100);
//text("E,L", 300,100);










