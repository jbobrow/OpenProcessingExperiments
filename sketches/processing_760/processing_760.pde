
PGraphics spiro;
PFont AndalMono;
float dent_P, dent_M, dent_T, dent_L, r_M, evol, vitesse, rot_M, offset, hu, colo_speed;
PVector p_P, p_M, p_txt, ligne;
int nb_dents_M, r_P;
boolean r_cw; 
//*******************************************************************************************************
void setup()
{
  size(900,660);
  colorMode(HSB,1);
  smooth();
  AndalMono = loadFont("AndaleMono-15.vlw");
  textFont(AndalMono, 15);
  strokeWeight(2);
  spiro = createGraphics(600,600,JAVA2D);
  spiro.beginDraw();
  spiro.colorMode(HSB,1);
  spiro.smooth();
  spiro.noFill();
  spiro.strokeWeight(2);
  spiro.endDraw();
  p_P        = new PVector(570,330);       // position du trou principal (le centre)
  r_P        = 300;                        // rayon du trou principal
  dent_P     = 2*PI/120.0005;              // taille en angle des dents du trou principal
  dent_L     = (2*PI*r_P)/120;             // largeur des dents
  nb_dents_M = 54;                         // nombre de dents de la piece mobile
  r_M        = (nb_dents_M*dent_L)/(2*PI); // rayon de la piece mobile
  dent_M     = 2*PI/(nb_dents_M+.0005);    // taille en angle des dents de la piece mobile
  p_M        = new PVector
    (p_P.x+sin(0)*(r_P-r_M)
    ,p_P.y+cos(0)*(r_P-r_M));              // position de la piece mobile
  dent_T     = 5;                          // taille en pixel des dents
  offset     = .5;
  vitesse    = 0.03;          // vitesse de rotation en angle autour du centre principal
  evol       = 0;       // evolution de la rotation autour du centre principal, en angle
  rot_M      = 0;               // evolution de la rotation de la piece mobile, en angle
  hu         = 0;
  p_txt      = new PVector (20,18,40);
  ligne      = new PVector (
  300+(r_P-r_M)*cos(evol-PI/2) + offset*r_M*cos(((r_P-r_M)/r_M)*evol)
    ,
  300-(r_P-r_M)*sin(evol-PI/2) + offset*r_M*sin(((r_P-r_M)/r_M)*evol));
  r_cw = true;
  colo_speed = 0;
}
//*******************************************************************************************************
void draw()
{
  hu= (hu+colo_speed > 1) ? hu-1+colo_speed : hu+colo_speed;
  background(.6,.3,1);
  fill(1);
  roue_crantee(p_P.x, p_P.y, r_P, 0, dent_P);
  rect(20, 435, 119, 26);
  image(spiro, 270, 30);
  fill(.6,.6,.5);
  textAlign(LEFT);
  text("THE GUIGUITROCHOID"                        ,p_txt.x,p_txt.z+p_txt.y * 0);
  text("The fixed cogwheel has 120 cogs."          ,p_txt.x,p_txt.z+p_txt.y * 2);
  text("The rolling cogwheel has:"                 ,p_txt.x,p_txt.z+p_txt.y * 4);
  text("cogs and his rolling speed is:"            ,p_txt.x,p_txt.z+p_txt.y * 6);
  text("radian per frame."                         ,p_txt.x,p_txt.z+p_txt.y * 8);
  text("The drawing point inside"                  ,p_txt.x,p_txt.z+p_txt.y * 10);
  text("the rolling cogwheel"                      ,p_txt.x,p_txt.z+p_txt.y * 11);
  text("is farther from its center"                ,p_txt.x,p_txt.z+p_txt.y * 12);
  text("time its radius."                          ,p_txt.x,p_txt.z+p_txt.y * 14);
  text("The framerate is "+round(frameRate)+" fps.",p_txt.x,p_txt.z+p_txt.y * 17);
  text("The framecount is "+round(frameCount)      ,p_txt.x,p_txt.z+p_txt.y * 19);
  text("The color cycling speed is"                ,p_txt.x,p_txt.z+p_txt.y * 26);
  text("cycle per frame."                          ,p_txt.x,p_txt.z+p_txt.y * 28);
  text("Press h to hide or unhide"                 ,p_txt.x,p_txt.z+p_txt.y * 30);
  text("the rolling cogwheel."                     ,p_txt.x,p_txt.z+p_txt.y * 31);
  text("Press the space bar to erase the drawing." ,p_txt.x,p_txt.z+p_txt.y * 33);
  fill(hu,1,1);
  text(" o < hue > p"                              ,p_txt.x,p_txt.z+p_txt.y * 23);
  fill(.6,1,.3);
  text("a < "+nb_dents_M+" > z"                    ,p_txt.x,p_txt.z+p_txt.y * 5);
  text("q < "+vitesse+" > s"                       ,p_txt.x,p_txt.z+p_txt.y * 7);
  text("w < "+offset+" > x "                       ,p_txt.x,p_txt.z+p_txt.y * 13);
  text("l < "+colo_speed+" > m "                   ,p_txt.x,p_txt.z+p_txt.y * 27);
  stroke(.6,.6,.5);
  noFill();
  rect(1, 1, width-2 , height-2);
  ellipse(p_P.x, p_P.y, r_P*2+dent_T*4, r_P*2+dent_T*4);
  evol = evol+vitesse;
  p_M.x = p_P.x+sin(evol)*(r_P-r_M);
  p_M.y = p_P.y+cos(evol)*(r_P-r_M);
  rot_M = -evol*(r_P-r_M)/r_M;
  if (r_cw == true)
  {
    fill(.6,.6,1,.5);
    roue_crantee(p_M.x, p_M.y, r_M, rot_M, dent_M);
    noFill();
    ellipse(p_M.x, p_M.y, r_M*2-dent_T*4, r_M*2-dent_T*4);
    line(
    p_P.x+(r_P-r_M)*cos(evol-PI/2) + (r_M-dent_T*2)*cos(((r_P-r_M)/r_M)*evol),
    p_P.y-(r_P-r_M)*sin(evol-PI/2) + (r_M-dent_T*2)*sin(((r_P-r_M)/r_M)*evol),
    p_P.x+(r_P-r_M)*cos(evol-PI/2) - (r_M-dent_T*2)*cos(((r_P-r_M)/r_M)*evol),
    p_P.y-(r_P-r_M)*sin(evol-PI/2) - (r_M-dent_T*2)*sin(((r_P-r_M)/r_M)*evol)
      );
    fill(hu,1,1);
    ellipse(
    p_P.x+(r_P-r_M)*cos(evol-PI/2) + offset*r_M*cos(((r_P-r_M)/r_M)*evol)
      ,
    p_P.y-(r_P-r_M)*sin(evol-PI/2) + offset*r_M*sin(((r_P-r_M)/r_M)*evol)
      , 7, 7);
  }
  spiro.beginDraw();
  spiro.stroke(hu,1,1);
  spiro.line(
  ligne.x
    ,
  ligne.y
    ,
  300+(r_P-r_M)*cos(evol-PI/2) + offset*r_M*cos(((r_P-r_M)/r_M)*evol)
    ,
  300-(r_P-r_M)*sin(evol-PI/2) + offset*r_M*sin(((r_P-r_M)/r_M)*evol)
    );
  spiro.endDraw();
  ligne.x= 300+(r_P-r_M)*cos(evol-PI/2) + offset*r_M*cos(((r_P-r_M)/r_M)*evol);
  ligne.y= 300-(r_P-r_M)*sin(evol-PI/2) + offset*r_M*sin(((r_P-r_M)/r_M)*evol);
}
//*******************************************************************************************************
void roue_crantee(float p_x, float p_y, float rayon, float rot, float dent)
{
  beginShape();
  vertex(
  p_x   + sin(rot+0)            * (rayon+dent_T)  ,  p_y + cos(rot+0)            * (rayon+dent_T)
    );
  for (float i = (dent); i < (2*PI); i = i+(dent)) {
    bezierVertex(
    p_x + sin(rot+i-(dent/6*5)) * (rayon+dent_T)  ,  p_y + cos(rot+i-(dent/6*5)) * (rayon+dent_T)
      ,
    p_x + sin(rot+i-(dent/6*4)) * (rayon-dent_T)  ,  p_y + cos(rot+i-(dent/6*4)) * (rayon-dent_T)
      ,
    p_x + sin(rot+i-(dent/6*3)) * (rayon-dent_T)  ,  p_y + cos(rot+i-(dent/6*3)) * (rayon-dent_T)
      );
    bezierVertex(
    p_x + sin(rot+i-(dent/6*2)) * (rayon-dent_T)  ,  p_y + cos(rot+i-(dent/6*2)) * (rayon-dent_T)
      ,
    p_x + sin(rot+i-(dent/6))   * (rayon+dent_T)  ,  p_y + cos(rot+i-(dent/6))   * (rayon+dent_T)
      ,
    p_x + sin(rot+i)            * (rayon+dent_T)  ,  p_y+cos(rot+i)              * (rayon+dent_T)
      );
  }
  endShape();
}
//*******************************************************************************************************
void keyPressed() {
  switch(key) {
  case 'a': 
    nb_dents_M = max(nb_dents_M-1,10);
    r_M        = (nb_dents_M*dent_L)/(2*PI);
    dent_M     = 2*PI/(nb_dents_M+.0005);
    break;
  case 'z': 
    nb_dents_M = min(nb_dents_M+1,120);
    r_M        = (nb_dents_M*dent_L)/(2*PI);
    dent_M     = 2*PI/(nb_dents_M+.0005);
    break;
  case 'q': 
    vitesse = max(vitesse-.001,-0.3);
    break;
  case 's': 
    vitesse = min(vitesse+.001,0.3);
    break;
  case 'w': 
    offset= max(offset-.01,0);
    break;
  case 'x': 
    offset = min(offset+.01,.9);
    break;
  case 'o': 
    hu= (hu+0.003 > 1) ? hu-.997 : hu+0.003;
    break;
  case 'p': 
    hu= (hu-0.003 < 0) ? hu+.997 : hu-0.003;
    break;
  case 'l': 
    colo_speed= max(colo_speed-.0001,0);
    break;
  case 'm': 
    colo_speed= min(colo_speed+.0001,0.01);
    break;
  case ' ': 
    spiro.beginDraw();
    spiro.noStroke();
    spiro.fill(1);
    spiro.ellipse(300,300,587,587);
    spiro.noFill();
    spiro.endDraw();
    break;
     case 'h': 
    r_cw = (r_cw == true) ? false : true;
    break;
  default:
    break;
  }
}


