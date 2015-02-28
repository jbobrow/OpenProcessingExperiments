
//Meghna Raghunathan
// Copyright Meghna Raghunathan
//lines
// Mouse moves it left and right
// up and down arrows increases width and height
 

float w,h;
  
 void setup()
{
  size(400,400);

w=width ;
h=height;
}
  
 void draw()
{
 noStroke();
 background(255);
   fill(146,141,141);
 

rect(.01*w,.011*w,mouseX,w*.01);
rect(.02*w,.021*w,mouseX,w*.01);
rect(.03*w,.031*w,mouseX,w*.01);
rect(.04*w,.041*w,mouseX,w*.01);
rect(.05*w,.051*w,mouseX,w*.01);
rect(.06*w,.061*w,mouseX,w*.01);
rect(.07*w,.071*w,mouseX,w*.01);
rect(.08*w,.081*w,mouseX,w*.01);
rect(.09*w,.091*w,mouseX,w*.01);

fill(84,80,80);
rect(.1*w,.101*w,mouseX,w*.01);
rect(.11*w,.111*w,mouseX,w*.01);
rect(.12*w,.121*w,mouseX,w*.01);
rect(.13*w,.131*w,mouseX,w*.01);
rect(.14*w,.141*w,mouseX,w*.01);
rect(.15*w,.151*w,mouseX,w*.01);
rect(.16*w,.161*w,mouseX,w*.01);
rect(.17*w,.171*w,mouseX,w*.01);
rect(.18*w,.181*w,mouseX,w*.01);
rect(.19*w,.191*w,mouseX,w*.01);

fill(56,55,50);
rect(.20*w,.201*w,mouseX,w*.01);
rect(.21*w,.211*w,mouseX,w*.01);
rect(.22*w,.221*w,mouseX,w*.01);
rect(.23*w,.231*w,mouseX,w*.01);
rect(.24*w,.241*w,mouseX,w*.01);
rect(.25*w,.251*w,mouseX,w*.01);
rect(.26*w,.261*w,mouseX,w*.01);
rect(.27*w,.271*w,mouseX,w*.01);
rect(.28*w,.281*w,mouseX,w*.01);
rect(.29*w,.291*w,mouseX,w*.01);
rect(.30*w,.301*w,mouseX,w*.01);


fill(84,80,80);

rect(.31*w,.311*w,mouseX,w*.01);
rect(.32*w,.321*w,mouseX,w*.01);
rect(.33*w,.331*w,mouseX,w*.01);
rect(.34*w,.341*w,mouseX,w*.01);
rect(.35*w,.351*w,mouseX,w*.01);
rect(.36*w,.361*w,mouseX,w*.01);
rect(.37*w,.371*w,mouseX,w*.01);
rect(.38*w,.381*w,mouseX,w*.01);
rect(.39*w,.391*w,mouseX,w*.01);
rect(.40*w,.401*w,mouseX,w*.01);

fill(90,141,146);

rect(.41*w,.411*w,mouseX,w*.01);
rect(.42*w,.421*w,mouseX,w*.01);
rect(.43*w,.431*w,mouseX,w*.01);
rect(.44*w,.441*w,mouseX,w*.01);
rect(.45*w,.451*w,mouseX,w*.01);
rect(.46*w,.461*w,mouseX,w*.01);
rect(.47*w,.471*w,mouseX,w*.01);
rect(.48*w,.481*w,mouseX,w*.01);
rect(.49*w,.491*w,mouseX,w*.01);
rect(.50*w,.501*w,mouseX,w*.01);

fill(149,201,206);
rect(.51*w,.511*w,mouseX,w*.01);
rect(.52*w,.521*w,mouseX,w*.01);
rect(.53*w,.531*w,mouseX,w*.01);
rect(.54*w,.541*w,mouseX,w*.01);
rect(.55*w,.551*w,mouseX,w*.01);
rect(.56*w,.561*w,mouseX,w*.01);
rect(.57*w,.571*w,mouseX,w*.01);
rect(.58*w,.581*w,mouseX,w*.01);
rect(.59*w,.591*w,mouseX,w*.01);
rect(.60*w,.601*w,mouseX,w*.01);

fill(160,214,219);
rect(.61*w,.611*w,mouseX,w*.01);
rect(.62*w,.621*w,mouseX,w*.01);
rect(.63*w,.631*w,mouseX,w*.01);
rect(.64*w,.641*w,mouseX,w*.01);
rect(.65*w,.651*w,mouseX,w*.01);
rect(.66*w,.661*w,mouseX,w*.01);
rect(.67*w,.671*w,mouseX,w*.01);
rect(.68*w,.681*w,mouseX,w*.01);
rect(.69*w,.691*w,mouseX,w*.01);
rect(.70*w,.701*w,mouseX,w*.01);

fill(199,235,238);
rect(.71*w,.711*w,mouseX,w*.01);
rect(.72*w,.721*w,mouseX,w*.01);
rect(.73*w,.731*w,mouseX,w*.01);
rect(.74*w,.741*w,mouseX,w*.01);
rect(.75*w,.751*w,mouseX,w*.01);
rect(.76*w,.761*w,mouseX,w*.01);
rect(.77*w,.771*w,mouseX,w*.01);
rect(.78*w,.781*w,mouseX,w*.01);
rect(.79*w,.791*w,mouseX,w*.01);
rect(.80*w,.801*w,mouseX,w*.01);


fill(199,235,238);
rect(.81*w,.811*w,mouseX,w*.01);
rect(.82*w,.821*w,mouseX,w*.01);
rect(.83*w,.831*w,mouseX,w*.01);
rect(.84*w,.841*w,mouseX,w*.01);
rect(.85*w,.851*w,mouseX,w*.01);
rect(.86*w,.861*w,mouseX,w*.01);
rect(.87*w,.871*w,mouseX,w*.01);
rect(.88*w,.881*w,mouseX,w*.01);
rect(.89*w,.891*w,mouseX,w*.01);
rect(.90*w,.901*w,mouseX,w*.01);


fill(225,237,238);
rect(.91*w,.911*w,mouseX,w*.01);
rect(.92*w,.92*w,mouseX,w*.01);
rect(.93*w,.931*w,mouseX,w*.01);
rect(.94*w,.941*w,mouseX,w*.01);
rect(.95*w,.951*w,mouseX,w*.01);
rect(.96*w,.961*w,mouseX,w*.01);
rect(.97*w,.971*w,mouseX,w*.01);
rect(.98*w,.981*w,mouseX,w*.01);
rect(.99*w,.991*w,mouseX,w*.01);
rect(w,w,mouseX,w*.01);






}


void keyPressed() {
  if (keyCode == UP) {
 w=w*.5;
}
  if (keyCode == DOWN) {
 w=w*2;}
}
 // saveFrame( “hw5.jpg”);




