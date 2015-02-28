
void setup()
{
  size(900,600);
  background(4,9,49);
}
 
void draw()
{
  // Ground
  fill(3,39,9);
  rect(0,350,900,250);
  // Moon Glow 1 (code sourced from http://processingjs.org/reference/arc_/)
  fill(200);
  arc(775,125,120,120,TWO_PI-PI/2,TWO_PI);
  // Moon Glow 2 (code sourced from http://processingjs.org/reference/arc_/)
  fill(220);
  arc(775,125,140,140,PI/2, PI);
  // Moon Glow 3 (code sourced from http://processingjs.org/reference/arc_/)
  fill(180);
  arc(775,125,105,105,0,PI/2);
  // Moon Glow 4 (code sourced from http://processingjs.org/reference/arc_/)
  fill(190);
  arc(775,125,155,155,PI, TWO_PI-PI/2);
  // Moon
  stroke(0);
  fill(255);
  ellipse(775,125,80,80);
  // Stars
  ellipse(85,75,5,5);
  noFill();
  stroke(255);
  strokeWeight(.5);
  arc(85,75,15,22,0,PI/2);
  arc(85,75,15,15,PI,TWO_PI-PI/2);
  arc(85,75,27,32,TWO_PI-PI/2,TWO_PI);
  arc(83,73,30,46,PI/2,PI);
  
  // Dirt Path
  stroke(0);
  fill(62,32,1);
  quad(512,350,537,350,480,600,280,600);
  //Lamp Post
  stroke(255);
  strokeWeight(.6);
  fill(45);
  rect(230,320,40,280);
  //Lamp Post Top
  fill(45);
  ellipse(250,250,115,190);
  // Lamp Middle Glow
  noStroke();
  fill(255,217,29,100);
  arc(245,250,225,295,TWO_PI-PI/2,TWO_PI);
  arc(245,250,225,295,0,PI/2);
  // Lamp Outer Glow
  fill(255,178,23,75);
  arc(260,250,255,345,PI/2,TWO_PI-PI/2);
  // Lamp Inner Glow
  fill(255,252,149);
  ellipse(250,250,105,180);
  // Background Buildings
  fill(60);
  triangle(628,195,656,195,642,225);
  fill(50);
  triangle(642,175,670,350,608,350);
  rect(720,230,40,120);
  rect(815,275,40,50);
  rect(685,282,35,20);
  // Foregroud buildings
  fill(0);
  rect(547,250,65,100);
  rect(670,290,200,60);
  rect(740,250,75,100);
  rect(612,305,100,45);
  rect(850,150,50,200);
  
}


