
/**
 *Sketch 2 : Randomization
 *Daniel Zhu 0412620
 *9/12/13
 */
 
 //Types for ellipseMode
int [] ellipseModeTypes = {RADIUS, CENTER, CORNER};

void setup() {
  //Canvas setup with black background
  //400 by 400 pixels
  size(400,400);
  
  //Displays 1 frame a second so you don't get a headache 
  //from flashing colors
  frameRate(1);
  
}

void draw() {
  //Refreshes background to black otherwise we would get a mesh of each
  //different sketch instance
  background(0);
  
  //Drawing stars
  stroke(255);
  point(50,100);
  point(100,25);
  point(300,40);
  point(75,275);
  
  //Choosing ellipseMode to use for instance of draw
  float index = random(0,2);
  int ellipseType = (int)index;
  
  //Getting random color for planet
  float red = random(1,250);
  float green = random(1,250);
  float blue = random(1,250);
  
  //Drawing planet
  ellipseMode(ellipseModeTypes[ellipseType]);
  fill(red,green,blue);
  
  //Random position, width, height
  float x = random(0,400);
  float y = random(0,400);
  float a = random(10,200);
  float b = random(10,200);
  ellipse(x,y,a,b);
  
  //Drawing with random color
  float reda = random(1,250);
  float greena = random(1,250);
  float bluea = random(1,250);
  stroke(reda,greena,bluea);
  
  //For adjusting where the ship will be in each instance with only
  //the y-axis changing since the designated 400 pixels by 400 pixels
  //is too small for any further differences in x
  float yfactora = random(-100,100);
  int yfactor = (int)yfactora;
  
  //Drawing right side gun
  line(36,150 + yfactor,80,164 + yfactor);
  line(80,164 + yfactor,80,174 + yfactor);
  line(80,174 + yfactor,4,149 + yfactor);
  line(4,149 + yfactor,32,154 + yfactor);
  line(32,154 + yfactor,36,150 + yfactor);
  
  //Drawing left side gun
  line(106,143 + yfactor,107,139 + yfactor);
  line(107,139 + yfactor,100,133 + yfactor);
  line(100,133 + yfactor,57,124 + yfactor);
  line(57,124 + yfactor,54,126 + yfactor);
  line(54,126 + yfactor,27,121 + yfactor);
  line(27,121 + yfactor,106,143 + yfactor);
  
  //Drawing front underbelly Section 1
  line(58,142 + yfactor,56,156 + yfactor);
  line(56,156 + yfactor,95,168 + yfactor);
  line(95,168 + yfactor,119,148 + yfactor);
  line(119,148 + yfactor,76,136 + yfactor);
  line(76,136 + yfactor,58,142 + yfactor);

  //Drawing front underbelly Section 2
  line(95,168 + yfactor,119,148 + yfactor);
  line(119,148 + yfactor,149,155 + yfactor);
  line(149,155 + yfactor,119,174 + yfactor);
  line(119,174 + yfactor,95,168 + yfactor);
  
  //Drawing main underbelly Section 3
  line(119,174 + yfactor,149,155 + yfactor);
  line(149,155 + yfactor,255,190 + yfactor);
  line(255,190 + yfactor,234,211 + yfactor);
  line(234,211 + yfactor,119,174 + yfactor);
  
  //Drawing back underbelly Section 4
  line(255,190 + yfactor,309,212 + yfactor);
  line(309,212 + yfactor,320,221 + yfactor);
  line(320,221 + yfactor,308,229 + yfactor);
  line(308,229 + yfactor,287,225 + yfactor);
  line(287,225 + yfactor,234,211 + yfactor);
  line(234,211 + yfactor,255,190 + yfactor);
  
  //Drawing leftside of the ship
  line(107,139 + yfactor,116,139 + yfactor);
  line(116,139 + yfactor,175,154 + yfactor);
  line(175,154 + yfactor,201,162 + yfactor);
  line(201,162 + yfactor,260,184 + yfactor);
  line(260,184 + yfactor,242,184 + yfactor);
  
  //Drawing left inner wing
  line(242,184 + yfactor,285,184 + yfactor);
  line(285,184 + yfactor,314,204 + yfactor);
  line(314,204 + yfactor,304,207 + yfactor);
  line(304,207 + yfactor,302,211 + yfactor);
  
  //Drawing right inner wing
  line(232,210 + yfactor,280,224 + yfactor);
  line(280,224 + yfactor,269,226 + yfactor);
  line(269,226 + yfactor,262,234 + yfactor);
  line(262,234 + yfactor,235,225 + yfactor);
  line(235,225 + yfactor,232,210 + yfactor);
  
  //Drawing right wing inner jet 1
  line(235,225 + yfactor,199,215 + yfactor);
  line(199,215 + yfactor,192,224 + yfactor);
  line(192,224 + yfactor,216,235 + yfactor);
  line(216,235 + yfactor,264,250 + yfactor);
  line(264,250 + yfactor,267,246 + yfactor);
  line(267,246 + yfactor,281,250 + yfactor);
  line(281,250 + yfactor,287,243 + yfactor);
  line(287,243 + yfactor,280,240 + yfactor);
  line(280,240 + yfactor,274,237 + yfactor);
  line(274,237 + yfactor,274,235 + yfactor);
  line(274,235 + yfactor,265,232 + yfactor);
  line(265,232 + yfactor,262,234 + yfactor);
  line(262,234 + yfactor,235,225 + yfactor);
  
  //Drawing right wing outter jet 2
  line(208,251 + yfactor,213,244 + yfactor);
  line(213,244 + yfactor,237,249 + yfactor);
  line(237,249 + yfactor,250,253 + yfactor);
  line(250,253 + yfactor,256,254 + yfactor);
  line(256,254 + yfactor,264,259 + yfactor);
  line(264,259 + yfactor,271,261 + yfactor);
  line(271,261 + yfactor,267,266 + yfactor);
  line(267,266 + yfactor,256,265 + yfactor);
  line(256,265 + yfactor,253,267 + yfactor);
  line(253,267 + yfactor,247,266 + yfactor);
  line(247,266 + yfactor,208,251 + yfactor);
  
  //Drawing right wing connection between jets
  line(236,241 + yfactor,237,250 + yfactor);
  line(255,247 + yfactor,249,253 + yfactor);
  
  //Drawing left wing inner jet 1
  line(261,167 + yfactor,281,160 + yfactor);
  line(281,160 + yfactor,342,202 + yfactor);
  line(342,202 + yfactor,354,216 + yfactor);
  line(354,216 + yfactor,341,219 + yfactor);
  line(341,219 + yfactor,334,213 + yfactor);
  line(334,213 + yfactor,330,215 + yfactor);
  line(330,215 + yfactor,315,206 + yfactor);
  line(315,206 + yfactor,261,167 + yfactor);
  
  //Drawing left wing outter jet 2
  line(314,168 + yfactor,333,165 + yfactor);
  line(333,165 + yfactor,373,196 + yfactor);
  line(373,196 + yfactor,377,197 + yfactor);
  line(377,197 + yfactor,383,202 + yfactor);
  line(383,202 + yfactor,384,207 + yfactor);
  line(384,207 + yfactor,384,210 + yfactor);
  line(384,210 + yfactor,388,215 + yfactor);
  line(388,215 + yfactor,373,216 + yfactor);
  line(373,216 + yfactor,359,207 + yfactor);
  line(359,207 + yfactor,355,207 + yfactor);
  line(355,207 + yfactor,350,202 + yfactor);
  line(350,202 + yfactor,349,197 + yfactor);
  line(349,197 + yfactor,314,168 + yfactor);
  
  //Drawing left wing connection
  line(319,182 + yfactor,331,182 + yfactor);
  line(339,199 + yfactor,348,197 + yfactor);
  
  //Drawing ship tail
  line(309,213 + yfactor,315,207 + yfactor);
  line(315,207 + yfactor,319,209 + yfactor);
  line(319,209 + yfactor,316,218 + yfactor);
  
  //Jet flame streaks
  stroke(130,126);
  
  //right wing outter
  line(269,267 + yfactor,309,277 + yfactor);
  line(272,262 + yfactor,314,276 + yfactor);
  
  //right wing inner
  line(283,250 + yfactor,313,256 + yfactor);
  line(287,245 + yfactor,324,257 + yfactor);
  
  //left wing inner
  line(343,220 + yfactor,376,243 + yfactor);
  line(355,211 + yfactor,376,235 + yfactor);
  
  //left wing outter
  line(390,215 + yfactor,395,220 + yfactor);
  line(374,217 + yfactor,392,230 + yfactor);
    
  
  
}


