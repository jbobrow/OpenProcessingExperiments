




boolean on = true;
boolean in = false;
//boolean ad = false;
boolean rectOver = false;


float dia = 0;
int alph__;
int fade_ = 255;
int fade__ = 255;
int alph_ = 0;
//variable for height of stat meter, CO2 footprint or total waste etc,.
int hei =0;
float ext = 779;
int accel = 1;
int tran = 0;

float rotationX2 = 0;
float rotationY2 = 90;
float rotationX = 0;
float rotationY = 0;

float px;
float py;

float rotationX_ = 0;
float rotationY_ = 0;
float velocityX = 0;
float velocityY = 0;

float pushBack = -900;




float rotX, rotY, factor;
PImage photo;
PImage sugar;
PImage sugar_;
PImage algae;
PImage oil;
PImage napth;
PImage title;
PImage reset;
PFont font;
int total = 16;
float xprev, yprev = 0;
float lineLength;
int q =0;
int alph = 0;
PImage[] images = new PImage[3];


boolean fall = false;
boolean hov = true;
boolean hov_ = true;
boolean mouseOver = false;
boolean fade = false;
class ball {
  String info;
  String lca;
  float xinit;
  float yinit;
  float xpos;
  float ypos;
  float accel;
  float xland;
  float diameter;
  int poll;
  boolean active;
  boolean returning;
  boolean ad;
  String name_;
  String zed = "0";

  public ball() {
    info = "What up";
    lca = "0";
    name_ ="hello";
    xinit=0;
    yinit=0;
    xpos = 0;
    ypos = 0;
    accel = 0;
    xland = 0;
    poll =0;
    active = false;
    returning = false;
    ad = false;
    diameter = 20;
  }
  public ball(float tx, float ty, String name, float xa, String inf, int pol, boolean a, String lcA, float diam) {
    lca = lcA;
    info = inf;
    name_ = name;
    xinit=tx;
    yinit=ty;
    xpos = tx;
    ypos = ty;
    accel = 0;
    xland = xa;
    poll = pol;
    ad = a;
    active = false;
    returning = false;
    diameter = diam;
  }




  void update() {
    // println(mouseY);

    if (balls[8].ypos >=650 && balls[9].ypos >=650  && balls[14].ypos >=650  && balls[15].ypos >=650 && balls[10].ypos >=650) {
      balls[10].returning = false;
    }
    if (balls[10].ypos >=650) {
      balls[11].returning = false;
      balls[12].returning = false;
    }
    if (balls[5].ypos >=650) {
      balls[6].returning = false;
    }
    if (balls[10].ypos >=650) {
      balls[3].returning = false;
    }
    if (balls[3].ypos >=650 || balls[4].ypos >=650  || balls[10].ypos >=650 ) {
      balls[6].returning = false;
    }
    if (balls[3].ypos >=650  || balls[10].ypos >=650 ) {
      balls[4].returning = false;
    }
    if (balls[1].ypos >=650 ) {
      balls[0].returning = false;
      balls[2].returning = false;
    }
    if (balls[2].ypos >=650 ) {
      balls[3].returning = false;
    }
    if (balls[7].ypos >=650 ) {
      balls[9].returning = false;
    }
    if (balls[13].ypos >=650 ) {
      balls[14].returning = false;
    }
    if (balls[1].ypos >=650 ) {
      balls[5].returning = false;
    }

    if (balls[8].ypos <=650 && balls[9].ypos <=650  && balls[14].ypos <=650  && balls[15].ypos <=650 && fall) {
      fall = false;
    }
    if (balls[8].ypos>= 750 && balls[9].ypos >= 750  && balls[14].ypos >= 750  && balls[15].ypos >= 750 && !fall) {
      balls[10].active = true;
      fall = true;



      if (accel < 1 && accel > -1 && ypos >=750) {
        accel =0;
        active = false;
      }
    }
    //if(balls[8].ypos>= 690 && balls[9].ypos >= 690  && balls[14].ypos >= 690  && balls[15].ypos >= 690 && fall){
    //balls[10].active = false;
    //fall = false;
    //}

    if (active && name_ == "Ethylene") {

      balls[11].active = true;
      balls[12].active = true;
      balls[3].active = true;
      balls[4].active = true;
      balls[6].active = true;
    } 
    else if (balls[10].returning) {


      //balls[11].returning = true;
      //balls[12].returning = true;
      //balls[3].returning = true;
      // balls[4].returning = true;
      // balls[6].returning = true;
    }
    if (active && name_ == "Sugar Cane") {

      balls[9].active = true;
    } 
    else if (balls[7].returning) {

      //balls[9].returning = true;
    }
    if (active && name_ == "Crude Oil") {
      balls[14].active = true;
    } 
    else if (balls[13].returning) {

      //balls[14].returning = true;
    }
    if (active && name_ == "Brine") {
      balls[0].active = true;
      balls[2].active = true;
      balls[3].active = true;
      balls[4].active = true;
      balls[5].active = true;
      balls[6].active = true;
    } 
    else if (balls[1].returning) {

      //balls[0].returning = true;
      // balls[2].returning = true;
      // balls[3].returning = true;
      // balls[4].returning = true;
      // balls[6].returning = true;
    }
    if (balls[2].active) {



      balls[3].active = true;
      balls[4].active = true;
      balls[6].active = true;
    } 
    else if (balls[2].returning) {


      // balls[3].returning = true;
      // balls[4].returning = true;
      // balls[6].returning = true;
    }
    if (active && name_ == "HCl") {

      balls[6].active = true;
    } 
    else if (balls[5].returning) {

      // balls[6].returning = true;
    }
    if (active && name_ == "EDC") {
      balls[4].active = true;
      balls[6].active = true;
    } 
    else if (balls[3].returning) {

      //balls[4].returning = true;
      //balls[6].returning = true;
    }
    if (active && name_ == "VCM") {

      balls[6].active = true;
    } 
    else if (balls[4].returning) {

      //balls[6].returning = true;
    }
    if (active) {
      if (!ad) {
        hei -= poll;
        ad = true;
      }
      accel += 1;
      ypos += accel;


      if (ypos > 750) {
        accel = accel*-.7;
        if (accel < 1 && accel > -1) {
          accel =0;
          active = false;
        }
      }
    }
    else if (returning) {
      if (ad) {
        hei += poll;
        ad = false;
      }
      accel += -2.1;
      ypos+= accel;

      if ((xpos- xinit) > 60) {

        xpos -=60;
      }
      else if ((xpos- xinit)< -60) {

        xpos+=60;
      }
      else {
        xpos = xinit;
      }

      if (ypos<= yinit) {
        accel = 0;
        ypos = yinit;
        if (ypos==yinit&&xpos==xinit)
          returning = false;
      }
    }
    else if ( yinit!= ypos) {

      if ((xpos- xland) > 45) {

        xpos -=45;
      }
      else if ((xpos- xland)< -45) {

        xpos+=45;
      }
      else {
        xpos = xland;
      }
    }
  }

  void display() {
    if (overRect(595, 580, 180, 80)) {
      //rect(595, 580, 180, 80);
      //rectOver = true;
      //image(sugar, 200.0, 200.0);
      rectOver = true;
    }
    else {
      rectOver = false;
    }
    //println(mouseX+ mouseY);
    stroke(16, 50, 64);
    strokeWeight(5);
    if ((balls[q].xpos== balls[q].xinit) && (balls[q].ypos== balls[q].yinit)) {
      if (balls[4].ypos == balls[4].yinit && balls[6].ypos == balls[6].yinit && (balls[4].xpos == balls[4].xinit && balls[6].xpos == balls[6].xinit)) {
        line(balls[4].xpos, balls[4].ypos, balls[6].xpos, balls[6].ypos);
        drawArrow(int(balls[4].xpos), int(balls[4].ypos), int(lineLength*243), 0);
      }

      if (balls[7].ypos == balls[7].yinit && balls[9].ypos == balls[9].yinit && balls[7].xpos == balls[7].xinit && balls[9].xpos == balls[9].xinit) {
        //bezier(balls[7].xpos, balls[7].ypos, 100.0, 300.0, 400.0, 300.0, balls[9].xpos,balls[9].ypos);
        line(balls[7].xpos, balls[7].ypos, balls[9].xpos, balls[9].ypos);
        drawArrow(int(balls[7].xpos), int(balls[7].ypos), int(lineLength*183), 6.5);
      }

      if (balls[12].ypos == balls[12].yinit && balls[10].ypos == balls[10].yinit && balls[12].xpos == balls[12].xinit && balls[10].xpos == balls[10].xinit) {
        line(balls[10].xpos, balls[10].ypos, balls[12].xpos, balls[12].ypos);
        drawArrow(int(balls[10].xpos), int(balls[10].ypos), int(lineLength*447), 5.5);
      }
      if (balls[8].ypos == balls[8].yinit && balls[10].ypos == balls[10].yinit && balls[8].xpos == balls[8].xinit && balls[10].xpos == balls[10].xinit) {
        line(balls[8].xpos, balls[8].ypos, balls[10].xpos, balls[10].ypos);
        drawArrow(int(balls[8].xpos), int(balls[8].ypos), int(lineLength*473), -5.3);
      }
      if (balls[11].ypos == balls[11].yinit && balls[10].ypos == balls[10].yinit && balls[11].xpos == balls[11].xinit && balls[10].xpos == balls[10].xinit) {
        line(balls[11].xpos, balls[11].ypos, balls[10].xpos, balls[10].ypos);
        drawArrow(int(balls[10].xpos), int(balls[10].ypos), int(lineLength*450), -9);
      }
      if (balls[10].ypos == balls[10].yinit && balls[14].ypos == balls[14].yinit && balls[10].xpos == balls[10].xinit && balls[14].xpos == balls[14].xinit ) {
        line(balls[14].xpos, balls[14].ypos, 1118/2+43, 630);
        drawArrow(int(balls[14].xpos), int( balls[14].ypos), int(lineLength*230), 0);
      }
      if (balls[13].ypos == balls[13].yinit && balls[14].ypos == balls[14].yinit && balls[13].xpos == balls[13].xinit && balls[14].xpos == balls[14].xinit ) {
        line(balls[13].xpos, balls[13].ypos, balls[14].xpos, balls[14].ypos);
        drawArrow(int(balls[13].xpos), int(balls[13].ypos), int(lineLength*182), 0);
      }
      if (balls[15].ypos == balls[15].yinit && balls[10].ypos == balls[10].yinit && balls[15].xpos == balls[15].xinit && balls[10].xpos == balls[10].xinit ) {
        line(balls[15].xpos, balls[15].ypos, 1118/2+211, 630);
        drawArrow(int(balls[15].xpos), int(balls[15].ypos), int(lineLength*335), 180);
      }
      if (balls[9].ypos == balls[9].yinit && balls[10].ypos == balls[10].yinit && balls[9].xpos == balls[9].xinit && balls[10].xpos == balls[10].xinit ) {
        line(balls[9].xpos, balls[9].ypos, balls[10].xpos, balls[10].ypos);
        drawArrow(int(balls[9].xpos), int(balls[9].ypos), int(lineLength*293), 10);
      }
      if (balls[0].ypos == balls[0].yinit && balls[1].ypos == balls[1].yinit && balls[0].xpos == balls[0].xinit && balls[1].xpos == balls[1].xinit ) {
        line(balls[0].xpos, balls[0].ypos, balls[1].xpos, balls[1].ypos);
        drawArrow(int(balls[1].xpos), int(balls[1].ypos), int(lineLength*72), -90);
      }
      if (((balls[14].ypos == balls[14].yinit && balls[10].ypos == balls[10].yinit) && (balls[14].xpos == balls[14].xinit && balls[10].xpos == balls[10].xinit))  || ((balls[15].ypos == balls[15].yinit &&  balls[10].ypos == balls[10].yinit) && (balls[15].xpos == balls[15].xinit &&  balls[10].xpos == balls[10].xinit))) {
        line(660, 600, balls[10].xpos, balls[10].ypos);
        drawArrow(660, 592, int(lineLength*130), -90);
      }
      if (balls[1].ypos == balls[1].yinit && balls[2].ypos == balls[2].yinit && balls[1].xpos == balls[1].xinit && balls[2].xpos == balls[2].xinit ) {
        line(balls[1].xpos, balls[1].ypos, balls[2].xpos, balls[2].ypos);
        drawArrow(int(balls[1].xpos), int(balls[1].ypos), int(lineLength*182), 0);
      }
      if (balls[2].ypos == balls[2].yinit && balls[3].ypos == balls[3].yinit && balls[2].xpos == balls[2].xinit && balls[3].xpos == balls[3].xinit ) {
        line(balls[2].xpos, balls[2].ypos, balls[3].xpos, balls[3].ypos);
        drawArrow(int(balls[2].xpos), int(balls[2].ypos), int(lineLength*333), 0);
      }
      if (balls[4].ypos == balls[4].yinit && balls[3].ypos == balls[3].yinit && balls[4].xpos == balls[4].xinit && balls[3].xpos == balls[3].xinit ) {
        line(balls[4].xpos, balls[4].ypos, balls[3].xpos, balls[3].ypos);
        drawArrow(int(balls[3].xpos), int(balls[3].ypos), int(lineLength*158), 0);
      }
      if (balls[5].ypos == balls[5].yinit && balls[6].ypos == balls[6].yinit && balls[5].xpos == balls[5].xinit && balls[6].xpos == balls[6].xinit ) {
        line(balls[5].xpos, balls[5].ypos, balls[6].xpos, balls[6].ypos);
        drawArrow(int(balls[5].xpos), int(balls[5].ypos), int((lineLength*150)), 28.5);
      }
      if (balls[10].ypos == balls[10].yinit && balls[3].ypos == balls[3].yinit && balls[10].xpos == balls[10].xinit && balls[3].xpos == balls[3].xinit ) {
        line(balls[10].xpos, balls[10].ypos, balls[3].xpos, balls[3].ypos);
        drawArrow(int(balls[10].xpos), int(balls[10].ypos), int(lineLength*232), -79);
      }
    }

    if (rectOver) {

      noLights();
      noStroke();
      fill(49, 89, 79);
      textFont(font, 17);


      text("Steam cracking is a petrochemical process in which saturated hydrocarbons are broken down into smaller hydrocarbons. Industrial method for producing lighter alkenes (olefins), including ethene (ethylene) and propene (propylene). In steam cracking, a gaseous or liquid hydrocarbon feed like naphtha or ethane is diluted with steam and briefly heated in a furnace without the presence of oxygen.", 1118/4+95, 0, 1118/4+255, 190);

      lights();
      pushMatrix();

      translate(1118/20 + 139, height/10-90, -230);
      //model16.draw();
      popMatrix();
    }

    if (mouseOver()) {


      /*  
       dia = balls[8].diameter;
       dia = dia*sin(radians(alph__));
       
       alph__++;
       ellipse(xpos, ypos, (dia/8)+(.1*balls[8].diameter), (dia/8)+(.1*balls[8].diameter));
       
       
       */

      if ((alph_ < 255 )) {
        fill(0, 0, 0, alph_);
        alph_ +=2.5;
        if (alph_ >= 255) {

          alph_ = 0;
        }
      }
      fill(0, 0, 0, alph_);

      //translate((94*width/100), (9*height/12)+(hei));
      // rotate(radians(180));
      if (ypos > yinit) {

        pushMatrix();

        translate((94*width/100)-20, (9*height/12)-hei-balls[q].poll);
        //noStroke();
        rect(0.0, 0.0, 20.0, balls[q].poll, 8.0, 8.0, 2.0, 2.0);
        fill(0, 0, 0);
        text("+"+balls[q].poll, 41, 0.5*balls[q].poll);
        // println(mouseX);


        //println(int(balls[q].ad));

        popMatrix();
      }
      else {
        pushMatrix();

        translate((94*width/100)-20, (9*height/12)-hei);
        noStroke();
        rect(0.0, 0.0, 20.0, balls[q].poll, 8.0, 8.0, 2.0, 2.0);
        fill(0, 0, 0);
        text("-"+balls[q].poll, 41, 0.5*balls[q].poll);
        // println(mouseX);


        //println(int(balls[q].ad));

        popMatrix();
      }


      lights();
      directionalLight(255, 255, 255, -1, -1, -1);
      ambientLight(255, 255, 255); 

      rotY-= .0001 ;
      rotX+= .003 + factor;
      factor += .00001;
      noFill();
      pushMatrix();
      translate(1118/20 + 139, height/10-90, -230);
      rotateX(rotY);
      rotateY(rotX);
      noStroke();
      if (q == 0) {
        rotX += .006+factor;
      }



      if (q== 7) {
        noLights();

        rotY-= 0;
        rotX =0;

        //image(sugar,+50.0,-200.0);
        scale(.56, .56, 1);
        translate(-59, -134, 0);
        image(sugar_, 0.0, 0.0);
      }

      if (q == 8) {
        noLights();
        rotY-= 0;
        rotX =0;
        // model8.draw();
        scale(.23, .23, 1);
        translate(-599, -464, 0);
        image(algae, 200, 200);
      }
      

      if (q== 13 ) {
        noLights();
        rotY-= 0;
        rotX =0;
        // model8.draw();
        scale(.5, .5, 1);
        translate(-509, -424, 0);
        image(oil, 280, 290);

        //model13.draw();
        in = true;
      }

      if (q == 14) {
        noLights();
        rotY-= 0;
        rotX =0;
        // model8.draw();
        scale(.3, .3, 1);
        translate(-539, -434, 0);
        image(napth, 220, 255);
      }

     
      popMatrix();
      /* fill(0,40);
       pushMatrix();
       translate(1118/20 - 38, height/10-150, -430);
       sphere(70);
       popMatrix();
       */

      // fill(0,0,0,10);
      stroke(255, 255, 255);

      //rect(140.0,20.0,690.0,150.0,8.0);

      fill(49, 89, 79);

      //fill (0,0,0);
      //image(images[1], 160, 30);

      textFont(font, 17);
      noLights();
      text(info, 1118/4+95, 0, 1118/4+235, 190);


      lights();

      textFont(font, 22);

      if ((alph < 255 )) {
        fill(0, 0, 0, alph);
        alph +=2.5;
        if (alph >= 255) {

          alph = 0;
        }
      }
    }
    else {



      fill(16, 64, 59);
      textFont(font, 20);
    }




    if (((name_ == "Ethylene") && ypos > balls[10].yinit) || (((name_ == "Crude Oil") && ypos > balls[13].yinit)) || (((name_ == "Brine") && ypos >balls[1].yinit)) || (((name_ == "Sugar Cane") && ypos >balls[7].yinit))) {
      fill(255, 0, 0);
    }
    noLights();
    pushMatrix();
    /*if (mouseOver()){
     translate((width/2 % xpos), (height/2 % ypos), 50);
     scale(4, 4, 4);
     }
     */
    text(name_, xpos-(5*name_.length()), ypos-(4*sqrt(diameter/(2*PI)))-11);
    if (lca.equals("1") == true) {

      fill(255, 215, 199);
    }



    if (lca.equals("2") == true) {

      fill(255, 159, 123);
    }

    if (lca.equals("3") == true) {
      fill(127, 80, 61);
    }
    if (lca.equals(zed) == false && ypos == yinit && xpos == xinit) {
      textFont(font, 23);
      noLights();
      text(lca, xpos+(5*name_.length())+7, ypos);
    }

    if (lca.equals("1") && (ypos > 700) && q == 12) {

      balls[11].lca = "1";
    }


    if (lca.equals("3") && (ypos == yinit) &&  balls[12].ypos > 700) {

      balls[6].lca = "2";
    }

    if (balls[6].lca.equals("1") && (balls[12].ypos == balls[12].yinit) ) {

      balls[6].lca = "2";
    }

    if ( (balls[12].ypos == balls[12].yinit) && (balls[11].ypos == balls[11].yinit) && (balls[6].ypos == balls[6].yinit) ) {

      balls[6].lca = "3";
      balls[11].lca = "2";
      balls[12].lca = "1";
    }


    if ( (balls[12].ypos == balls[12].yinit) && (balls[6].ypos == balls[6].yinit) && (balls[11].ypos != balls[11].yinit) ) {

      balls[6].lca = "2";
      balls[12].lca = "1";
    }

    if (  (balls[6].ypos == balls[6].yinit) && (balls[11].ypos == balls[11].yinit) && (balls[12].ypos != balls[12].yinit)) {

      balls[6].lca = "2";
      balls[11].lca = "1";
    }

    if (  (balls[11].ypos == balls[11].yinit) && (balls[12].ypos == balls[12].yinit) && (balls[6].ypos != balls[6].yinit)) {

      balls[11].lca = "2";
      balls[12].lca = "1";
    }


    if (lca.equals("1") && (ypos > 700) && q == 11) {

      balls[6].lca = "1";
    }



    //println(name_.length());
    ellipse(xpos, ypos, 8*sqrt(diameter/(2*PI)), 8*sqrt(diameter/(2*PI)));
    popMatrix();
    pushMatrix();
    translate(xpos, ypos);
    //sphere(diameter/2);

    popMatrix();
    fill(16, 64, 59);
    stroke(49, 79, 79);
  }

  boolean mouseOver() {
    if (sqrt(sq(xpos - mouseX) + sq(ypos - mouseY)) < 4*sqrt(diameter/(2*PI)) ) {
      if (hov) {

        hov = false;
        hov_ = false;
        noFill();
      }
      return true;
    } 
    else {

      hov_ = true;
      return false;
    }
  }

  boolean overRect(int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
      return true;
    } 
    else {
      return false;
    }
  }
}




ball[] balls;

void setup() {
  factor = .000015;
  textAlign(CENTER, CENTER);

 
  title = loadImage("chemical-ecosystem.png");
  sugar = loadImage("sugar_.png");
  sugar_ = loadImage("sugar.png");
  algae = loadImage("algae.jpg");
  oil = loadImage("crude.png");
  napth = loadImage("napth.png");
  reset = loadImage("reset.png");        


  //texmap2 = loadImage("moon_.jpg"); 




  // Uncomment the following two lines to see the available fonts 
  //String[] fontList = PFont.list();
  //println(fontList);
  font = createFont("Helvetica", 20);
  smooth(8);
  size(1280, 800, P3D);
  // font = loadFont("Batang-36.vlw");
  /*
for ( int i = 0; i< images.length; i++ )
   {
   images[i] = loadImage( i + ".png" );   // make sure images "0.jpg" to "11.jpg" exist
   }*/
  balls = new ball[total];
  balls[0] = new ball(189, 160, "NaOH", ((1118/16)-30), "Sodium hydroxide, (lye or caustic soda) has the molecular formula NaOH and is a highly caustic metallic base. Worldwide production in 2004 was approximately 60 million tonnes.", 20, false, "0", 51.0); //51 million tonnes
  balls[1] = new ball(189, 232, "Brine", (((1118/16)*2)-30), "Brine is a solution of salt (usually sodium chloride) in water. The chloralkali process is an industrial process for the electrolysis of sodium chloride solution, to make chlorine and sodium hydroxide. ", 40, false, "0", 51.0);//51 million tonnes
  balls[2] = new ball(371, 232, "Chlorine", (((1118/16)*3)-30), "Chlorine is a yellow-green gas under standard conditions, where it forms diatomic molecules. It has the highest electron affinity and the third highest electronegativity of all the elements; for this reason, chlorine is a strong oxidizing agent.", 55, false, "0", 30.0); //30 million tonnes
  balls[3] = new ball(704, 232, "EDC", (((1118/16)*4)-30), "The chemical compound 1,2-dichloroethane (or DCE) commonly known by its old name of ethylene dichloride (EDC), is a chlorinated hydrocarbon, mainly used to produce vinyl chloride monomer (VCM, chloroethene), the major precursor for PVC production.", 65, false, "0", 20.0) ; //20 million tonnes
  balls[4] = new ball(862, 232, "VCM", (((1118/16)*5)-30), "Vinyl chloride monomer is an organochloride with the formula H2C:CHCl. This colorless compound is an important industrial chemical chiefly used to produce the polymer polyvinyl chloride (PVC). Vinyl chloride is a highly toxic, flammable, and carcinogenic gas with a sweet odor.", 70, false, "0", 31.0); //31.1 million tonnes
  balls[5] = new ball(973, 160, "HCl", (((1118/16)*6)-30), "Hydrochloric acid is a clear, colourless solution of hydrogen chloride (HCl) in water. It is a highly corrosive, strong mineral acid with many industrial uses. Brine solution is electrolyzed producing chlorine, sodium hydroxide, and hydrogen. The pure chlorine gas can be combined with hydrogen to produce hydrogen chloride in the presence of UV light.", 33, false, "0", 20.0); //20 million tonnes
  balls[6] = new ball(1105, 232, "PVC", (((1118/16)*7)-30), "Polyvinyl chloride, commonly abbreviated PVC, is the third-most widely produced plastic, after polyethylene and polypropylene. It can be made softer and more flexible by the addition of plasticizers, the most widely used being phthalates. In this form, it is also used in clothing and upholstery, electrical cable insulation, inflatable products and many applications in which it replaces rubber.", 80, false, "3", 47.5); //47,5 million tonnes
  balls[7] = new ball(189, 390, "Sugar Cane", (((1118/16)*8)-30), "Native to the warm temperate to tropical regions of South Asia, they have stout jointed fibrous stalks that are rich in sugar, and measure two to six metres tall. All sugar cane species interbreed, and the major commercial cultivars are complex hybrids.", 20, false, "0", 12.0);
  balls[8] = new ball(189, 503, "Algae", (((1118/16)*9)-30), "Algae are a very large and diverse group of simple, typically autotrophic organisms, ranging from unicellular to multicellular forms.Many types of algae can produce ethylene in measurable quantities.  algae can be genetically manipulated in order to produce ethylene in larger amounts and more efficiently. ", 14, false, "0", 31.0);
  balls[9] = new ball(371, 410, "etOH", (((1118/16)*10)-30), "Ethanol is a volatile, flammable and colorless liquid. Ethanol is a versatile solvent, miscible with water and with many organic solvents, including acetone, benzene, and toluene. Ethanol is produced both as a petrochemical, through the hydration of ethylene and, via biological processes, by fermenting sugars with yeast.", 24, false, "0", 10.0);
  balls[10] = new ball(1118/2+101, height/2+60, "Ethylene", (((1118/16)*11)-30), "Ethylene is an organic hydrocarbon with the formula C2H4 or H2C=CH2. Ethylene is widely used in chemical industry, and its worldwide production (over 109 million tonnes in 2006) exceeds that of any other organic compound. Ethylene is also an important natural plant hormone, used in agriculture to force the ripening of fruits.", 12, false, "0", 109.0);
  balls[11] = new ball(1105, 390, "LDPE", (((1118/16)*12)-30), "Low-density polyethylene (LDPE) is a thermoplastic made from the monomer ethylene. In 2009 the worldwide LDPE market reached a volume of US$22.2 billion.", 11, false, "2", 18.9);
  balls[12] = new ball(1105, 503, "HDPE", (((1118/16)*13)-30), "High-density polyethylene (HDPE) or polyethylene high-density (PEHD) is a polyethylene thermoplastic made from petroleum. It takes 1.75 kilograms of petroleum to make one kilogram of HDPE.", 5, false, "1", 30.0);
  balls[13] = new ball(189, 630, "Crude Oil", (((1118/16)*14)-30), "Crude oil is a naturally occurring flammable liquid consisting of a complex mixture of hydrocarbons of various molecular weights and other liquid organic compounds. A fossil fuel is formed of large quantities of dead organisms, buried underneath sedimentary rock and exposed to intense heat and pressure.", 11, false, "0", 800.0);
  balls[14] = new ball(371, 630, "Naphtha", (((1118/16)*15)-30), "Naphtha is a component of natural gas condensate or a distillation  product from petroleum, coal tar or peat boiling in a certain range and containing certain hydrocarbons.", 2, false, "0", 100.0);
  balls[15] = new ball(1105, 630, "Natural Gas", (((1118/16)*16)-30), "Natural gas is a naturally occurring hydrocarbon gas mixture  consisting primarily of methane, with other hydrocarbons, carbon dioxide, nitrogen and hydrogen sulfide.", 12, false, "0", 264.0);

  for (int i =0; i< total; i++) {
    hei += balls[i].poll;
    //println(hei);
  }
}


void draw() {




  background(162, 211, 239);
  tint(162, 211, 239);
  if ((mouseX>60 && mouseX < 105) && (mouseY>60 && mouseY < 105)) {
    noTint();
  }
  image(reset, 60, 60);
  noTint();
  pushMatrix();
  translate((94*width/100), (9*height/12));
  rotate(radians(180));
  fill(49, 89, 79);
  rect(0, 0, 20, hei, 8);

  // println(mouseX);

  popMatrix();
  fill(20, 49, 39);
  text( hei, (94*width/100+25), (9.3*height/12-30)); 
  text("CO2", (94*width/100-10), (9.3*height/12)); 
  for (int i=0;i<total;i++) {

    if (in) {

      pushMatrix();
      noLights();


      scale(.7, .7, 1);
      translate(58, -80, -80);
      //image(oil,200,200);
      popMatrix();
      in = false;
    }
    fill(16, 64, 59);
    stroke(16, 50, 64);
    pushMatrix();
    translate(686.0, 630.0, -40);

    scale(3.47, 1.05, 1);
    box(50);
    translate(0, -3, -3);
    fill(20, 49, 39);
    noStroke();
    box(50);
    stroke(49, 89, 79);
    popMatrix();
    pushMatrix();
    translate(0, 0, -10);
    fill(255, 255, 255);
    textFont(font, 20);
    //stroke(0,0,0);
    text("Cracking", 676, 626);
    popMatrix();
    //model16.draw();


    if (  balls[0].mouseOver() == false || balls[1].mouseOver() == false || balls[2].mouseOver() == false ||
      balls[3].mouseOver() == false || balls[4].mouseOver() == false || balls[5].mouseOver() == false || balls[6].mouseOver() == false ||
      balls[7].mouseOver() == false || balls[8].mouseOver() == false || balls[9].mouseOver() == false  || balls[10].mouseOver() == false
      || balls[11].mouseOver() == false || balls[12].mouseOver() == false || balls[13].mouseOver() == false || balls[14].mouseOver() == false
      || balls[14].mouseOver() == false  || balls[15].mouseOver() == false) {

      //println("not on");
      on = true;
    }


    if (balls[0].mouseOver() == true || balls[1].mouseOver() == true || balls[2].mouseOver() == true ||
      balls[3].mouseOver() == true || balls[4].mouseOver() == true || balls[5].mouseOver() == true || balls[6].mouseOver() == true ||
      balls[7].mouseOver() == true || balls[8].mouseOver() == true || balls[9].mouseOver() == true  || balls[10].mouseOver() == true
      || balls[11].mouseOver() == true || balls[12].mouseOver() == true || balls[13].mouseOver() == true || balls[14].mouseOver() == true
      || balls[14].mouseOver() == true  || balls[15].mouseOver() == true) {

      // println(" on");
      on = false;
    }




    if (on && !rectOver) {
      noFill();
      stroke(49, 79, 79);

      //rect(210.0,30.0,725.0,138.0,8.0);
      //strokeWeight(1);
      stroke(49, 89, 79, tran);
      fill(49, 89, 79, tran/4);

      textFont(font, 46);
      // text("Chemical Ecosystem",619, 90 );
      image(title, 371, 41 );

      strokeWeight(10);
      if (tran >= 0 && !(tran == 1020)) {
        tran ++;
      }
      if (ext <= 839 && !(ext < 383) ) {
        ext-= .01 * accel;
        accel ++;
      }
      fill(16, 64, 59);
      line(ext, 110, 839, 110);

      angle-=(1/29.5);
      if (angle>=360) {
        angle = 0;
      }
      angle2-=((1/29.5)/29);
      if (angle2>=360) {
        angle2 = 0;
      }
      //renderGlobe(); 
      //directionalLight(55, 55, 55, -1, -1, -1);
      pushMatrix();
      translate(-700, -394, 0);

      //noLights();

      popMatrix();


      fill( 162, 211, 239, fade__);
      stroke(162, 211, 239, fade__);
      rect(210.0, 30.0, 725.0, 138.0, 8.0);
      if (fade__ > 0) {
        fade__ -= 1;
      }
    } 
    else {
      fade__ = 255;
    }


    q = i;
    balls[i].update();
    balls[i].display(); 


    if (balls[i].ypos > 710 ) {
      balls[i].ypos = 750;
      //balls[i].xpos = balls[i].xland;
    }

    lineLength +=.0003;
    if (lineLength> 1) {
      lineLength = 0;
    }
  }



  if (!on || rectOver) {

    fill(12, 242, 219, 50);
    stroke(49, 79, 79);

    rect(210.0, 30.0, 725.0, 138.0, 8.0);

    fill( 162, 211, 239, fade_);
    stroke(162, 211, 239, fade_);
    rect(210.0, 30.0, 725.0, 138.0, 8.0);
    if (fade_ != 0) {
      fade_ -= 5;
    } 
    fill(12, 242, 219, 50);
    stroke(49, 79, 79);
  }
}

void mousePressed() {
  if ((mouseX>60 && mouseX < 105) && (mouseY>60 && mouseY < 105)) {
    /*hei = 0;
     for(int i =0; i< total; i++){
     hei += balls[i].poll;
     //println(hei);
     }
     */

    for (int i=0; i < 16; i++) {
      if (balls[i].ypos != balls[i].yinit) {
        balls[i].returning = true;
        //balls[i].ypos = balls[i].yinit;
      }
    }
    //hei += balls[i].poll;
    //println(hei);
  }

  for (int i=0; i < 16; i++) {

    if (balls[i].mouseOver()) {

      if (balls[i].yinit == balls[i].ypos) {
     
        balls[i].active = true;

        hei -= balls[i].poll;
        balls[i].ad = true;
      }
      else {


        balls[i].returning = true;
       
      }
    }
  }
}


void mouseMoved() {
  color c = get(mouseX, mouseY);
  if ( c == color(162, 211, 239) ) {
    fade_ = 255;
    hov = true;
    rotY = 0;
    rotX = 0;
    mouseOver =false;
  }
  else {
    mouseOver = true;
  }
  if (mouseY > 695) {
    hov = false;
  }
}
void drawArrow(int cx, int cy, int len, float angle) {
  pushMatrix();
  translate(cx, cy);
  rotate(radians(angle));
  line(0, 0, len, 0);
  line(len, 0, len - 8, -8);
  line(len, 0, len - 8, 8);
  popMatrix();
}







