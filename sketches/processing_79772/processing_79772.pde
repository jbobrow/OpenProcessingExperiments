
float a, angle = 0;

int i, t = 0; 

void setup() {
  size(480, 480);
  colorMode(HSB, 360);
  //frameRate(50);

  smooth();
  background(0);

}


void draw() {
  
  a = map(t, 0, width, 0, 1);
  t = t + 6;
  if (t > 825) {
    t = 0;
  }

  background(0);

  pushMatrix();

    translate(240,240);

  float angle = 0;
  if (a > 0.5) {
    angle = map(a, 0.5, 1, 0.5, 11*PI);
  } 
  else {
    float ty = map(a, 0, 0.5, 250, 0);
    translate(random(11), ty);
  }
  
    
//    for (int d = 0; d < num; d++) {
//  x[d] = int(20/random(10));
//  y[d] = int(width/num*d);
//   }


  noStroke();
  fill(random(360), random(300, 360), random(250, 360));


  //for (i=0;i<200;i=i+10) {
  //ellipse(0*angle, i*angle, 5, 5);
  //}


  ellipse(0*angle, 2*angle, 3, 3);//1ban
  ellipse(2*angle, 0*angle, 3, 3);
  ellipse(0*angle, -2*angle, 3, 3);
  ellipse(-2*angle, 0*angle, 3, 3);

  ellipse(0*angle, 3*angle, 3, 3);//2ban
  ellipse(0*angle, -3*angle, 3, 3);
  ellipse(3*angle, 0*angle, 3, 3);
  ellipse(-3*angle, 0*angle, 3, 3);

  ellipse(0*angle, 4*angle, 3, 3);//3ban
  ellipse(0*angle, -4*angle, 3, 3);
  ellipse(4*angle, 0*angle, 3, 3);
  ellipse(-4*angle, 0*angle, 3, 3);

  ellipse(0*angle, 5*angle, 3, 3);//4ban
  ellipse(0*angle, -5*angle, 3, 3);
  ellipse(5*angle, 0*angle, 3, 3);
  ellipse(-5*angle, 0*angle, 3, 3);

  ellipse(0*angle, 6*angle, 3, 3);//5ban
  ellipse(0*angle, -6*angle, 3, 3);
  ellipse(6*angle, 0*angle, 3, 3);
  ellipse(-6*angle, 0*angle, 3, 3);

  ellipse(0*angle, 7*angle, 3, 3);//6ban
  ellipse(0*angle, -7*angle, 3, 3);
  ellipse(7*angle, 0*angle, 3, 3);
  ellipse(-7*angle, 0*angle, 3, 3);

  ellipse(0*angle, 8*angle, 3, 3);//7ban
  ellipse(0*angle, -8*angle, 3, 3);
  ellipse(8*angle, 0*angle, 3, 3);
  ellipse(-8*angle, 0*angle, 3, 3);

  ellipse(0*angle, 9*angle, 5, 5);//8ban
  ellipse(0*angle, -9*angle, 5, 5);
  ellipse(9*angle, 0*angle, 5, 5);
  ellipse(-9*angle, 0*angle, 5, 5);


  ellipse(1*angle, 1*angle, 3, 3);//migisita1
  ellipse(2*angle, 2*angle, 3, 3);
  ellipse(3*angle, 3*angle, 3, 3);
  ellipse(4*angle, 4*angle, 3, 3);
  ellipse(5*angle, 5*angle, 3, 3);
  ellipse(6*angle, 6*angle, 4, 4);

  ellipse(-1*angle, 1*angle, 3, 3);//hidarisita1
  ellipse(-2*angle, 2*angle, 3, 3);
  ellipse(-3*angle, 3*angle, 3, 3);
  ellipse(-4*angle, 4*angle, 3, 3);
  ellipse(-5*angle, 5*angle, 3, 3);
  ellipse(-6*angle, 6*angle, 4, 4);

  ellipse(1*angle, -1*angle, 3, 3);//migiue1
  ellipse(2*angle, -2*angle, 3, 3);
  ellipse(3*angle, -3*angle, 3, 3);
  ellipse(4*angle, -4*angle, 3, 3);
  ellipse(5*angle, -5*angle, 3, 3);
  ellipse(6*angle, -6*angle, 4, 4);

  ellipse(-1*angle, -1*angle, 3, 3);//hidariue1
  ellipse(-2*angle, -2*angle, 3, 3);
  ellipse(-3*angle, -3*angle, 3, 2);
  ellipse(-4*angle, -4*angle, 3, 2);
  ellipse(-5*angle, -5*angle, 3, 2);
  ellipse(-6*angle, -6*angle, 4, 4);

  ellipse(-1*angle, 2*angle, 3, 2);//hidarisita2
  ellipse(-1.5*angle, 3*angle, 3, 2);
  ellipse(-2*angle, 4*angle, 3, 2);
  ellipse(-2.5*angle, 5*angle, 3, 2);
  ellipse(-3*angle, 6*angle, 3, 2);
  ellipse(-3.5*angle, 7*angle, 3, 2 );
  ellipse(-4*angle, 8*angle, 4, 4);

  ellipse(1*angle, -2*angle, 3, 2);//migiue2
  ellipse(1.5*angle, -3*angle, 3, 2);
  ellipse(2*angle, -4*angle, 3, 2);
  ellipse(2.5*angle, -5*angle, 3, 2);
  ellipse(3*angle, -6*angle, 3, 2);
  ellipse(3.5*angle, -7*angle, 3, 2);
  ellipse(4*angle, -8*angle, 4, 4);

  ellipse(-1*angle, -2*angle, 3, 2);//hidarisita2
  ellipse(-1.5*angle, -3*angle, 3, 2);
  ellipse(-2*angle, -4*angle, 3, 2);
  ellipse(-2.5*angle, -5*angle, 3, 2);
  ellipse(-3*angle, -6*angle, 3, 2);
  ellipse(-3.5*angle, -7*angle, 3, 2);
  ellipse(-4*angle, -8*angle, 4, 4);

  ellipse(1*angle, 1*angle, 3, 2);//migisita2
  ellipse(1*angle, 2*angle, 3, 2);
  ellipse(1.5*angle, 3*angle, 3, 2);
  ellipse(2*angle, 4*angle, 3, 2);
  ellipse(2.5*angle, 5*angle, 3, 2);
  ellipse(3*angle, 6*angle, 3, 2);
  ellipse(3.5*angle, 7*angle, 3, 2);
  ellipse(4*angle, 8*angle, 4, 4);

  ellipse(1.5*angle, 0.5*angle, 3, 2);//migisita
  ellipse(2.5*angle, 1*angle, 3, 2);
  ellipse(3.5*angle, 1.5*angle, 3, 2);
  ellipse(4.5*angle, 2*angle, 3, 2);
  ellipse(5.5*angle, 2.5*angle, 3, 2);
  ellipse(6.5*angle, 3*angle, 3, 2);
  ellipse(7.5*angle, 3.5*angle, 4, 4);

  ellipse(-1.5*angle, 0.5*angle, 3, 2);//hidarisita
  ellipse(-2.5*angle, 1*angle, 3, 2);
  ellipse(-3.5*angle, 1.5*angle, 3, 2);
  ellipse(-4.5*angle, 2*angle, 3, 2);
  ellipse(-5.5*angle, 2.5*angle, 3, 2);
  ellipse(-6.5*angle, 3*angle, 3, 2);
  ellipse(-7.5*angle, 3.5*angle, 4, 4);

  ellipse(-1.5*angle, -0.5*angle, 3, 2);//hidariue
  ellipse(-2.5*angle, -1*angle, 3, 2);
  ellipse(-3.5*angle, -1.5*angle, 3, 2);
  ellipse(-4.5*angle, -2*angle, 3, 2);
  ellipse(-5.5*angle, -2.5*angle, 3, 2);
  ellipse(-6.5*angle, -3*angle, 3, 2);
  ellipse(-7.5*angle, -3.5*angle, 4, 4);

  ellipse(1.5*angle, -0.5*angle, 3, 2);//migiue
  ellipse(2.5*angle, -1*angle, 3, 2);
  ellipse(3.5*angle, -1.5*angle, 3, 2);
  ellipse(4.5*angle, -2*angle, 3, 2);
  ellipse(5.5*angle, -2.5*angle, 3, 2);
  ellipse(6.5*angle, -3*angle, 3, 2);
  ellipse(7.5*angle, -3.5*angle, 4, 4);



  fill(random(360), random(300, 360), random(250, 360));


  ellipse(0*angle, 10*angle, 3, 2);//9ban
  ellipse(0*angle, -10*angle, 3, 2);
  ellipse(10*angle, 0*angle, 3, 2);
  ellipse(-10*angle, 0*angle, 3, 2);

  ellipse(0*angle, 11*angle, 3, 2);//10ban
  ellipse(0*angle, -11*angle, 3, 2);
  ellipse(11*angle, 0*angle, 3, 2);
  ellipse(-11*angle, 0*angle, 3, 2);

  ellipse(0*angle, 12*angle, 3, 2);//11ban
  ellipse(0*angle, -12*angle, 3, 2);
  ellipse(12*angle, 0*angle, 3, 2);
  ellipse(-12*angle, 0*angle, 3, 2);

  ellipse(0*angle, 13*angle, 3, 2);//12ban
  ellipse(0*angle, -13*angle, 3, 2);
  ellipse(13*angle, 0*angle, 3, 2);
  ellipse(-13*angle, 0*angle, 3, 2);

  ellipse(0*angle, 14*angle, 3, 2);//13ban
  ellipse(0*angle, -14*angle, 3, 2);
  ellipse(14*angle, 0*angle, 3, 2);
  ellipse(-14*angle, 0*angle, 3, 2);

  ellipse(0*angle, 15*angle, 3, 2);//14ban
  ellipse(0*angle, -15*angle, 3, 2);
  ellipse(15*angle, 0*angle, 3, 2);
  ellipse(-15*angle, 0*angle, 3, 2);

  ellipse(0*angle, 16*angle, 3, 2);//15ban
  ellipse(0*angle, -16*angle, 3, 2);
  ellipse(16*angle, 0*angle, 3, 2);
  ellipse(-16*angle, 0*angle, 3, 2);

  ellipse(0*angle, 17*angle, 3, 2);//16ban
  ellipse(0*angle, -17*angle, 3, 2);
  ellipse(17*angle, 0*angle, 3, 2);
  ellipse(-17*angle, 0*angle, 3, 2);

  ellipse(0*angle, 18*angle, 3, 2);//17ban
  ellipse(0*angle, -18*angle, 3, 2);
  ellipse(18*angle, 0*angle, 3, 2);
  ellipse(-18*angle, 0*angle, 3, 2);

  ellipse(0*angle, 19*angle, 3, 2);//18ban
  ellipse(0*angle, -19*angle, 3, 2);
  ellipse(19*angle, 0*angle, 3, 2);
  ellipse(-19*angle, 0*angle, 3, 2);

  ellipse(0*angle, 20*angle, 3, 2);//19ban
  ellipse(0*angle, -20*angle, 3, 2);
  ellipse(20*angle, 0*angle, 3, 2);
  ellipse(-20*angle, 0*angle, 3, 2);

  ellipse(0*angle, 21*angle, 3, 2);//20ban
  ellipse(0*angle, -21*angle, 3, 2);
  ellipse(21*angle, 0*angle, 3, 2);
  ellipse(-21*angle, 0*angle, 3, 2);

  ellipse(0*angle, 22*angle, 3, 2);//21ban
  ellipse(0*angle, -22*angle, 3, 2);
  ellipse(22*angle, 0*angle, 3, 2);
  ellipse(-22*angle, 0*angle, 3, 2);

  ellipse(0*angle, 23*angle, 3, 2);//22ban
  ellipse(0*angle, -23*angle, 3, 2);
  ellipse(23*angle, 0*angle, 3, 2);
  ellipse(-23*angle, 0*angle, 3, 2);

  ellipse(0*angle, 24*angle, 3, 2);//23ban
  ellipse(0*angle, -24*angle, 3, 2);
  ellipse(24*angle, 0*angle, 3, 2);
  ellipse(-24*angle, 0*angle, 3, 2);

  ellipse(0*angle, 25*angle, 3, 2);//24ban
  ellipse(0*angle, -25*angle, 3, 2);
  ellipse(25*angle, 0*angle, 3, 2);
  ellipse(-25*angle, 0*angle, 3, 2);

  ellipse(0*angle, 26*angle, 3, 2);//25ban
  ellipse(0*angle, -26*angle, 3, 2);
  ellipse(26*angle, 0*angle, 3, 2);
  ellipse(-26*angle, 0*angle, 3, 2);

  ellipse(0*angle, 27*angle, 3, 2);//26ban
  ellipse(0*angle, -27*angle, 3, 2);
  ellipse(27*angle, 0*angle, 3, 2);
  ellipse(-27*angle, 0*angle, 3, 2);

  ellipse(0*angle, 28*angle, 3, 2);//27ban
  ellipse(0*angle, -28*angle, 3, 2);
  ellipse(28*angle, 0*angle, 3, 2);
  ellipse(-28*angle, 0*angle, 3, 2);

  ellipse(0*angle, 29*angle, 3, 2);//28ban
  ellipse(0*angle, -29*angle, 3, 2);
  ellipse(29*angle, 0*angle, 3, 2);
  ellipse(-29*angle, 0*angle, 3, 2);

  ellipse(0*angle, 30*angle, 3, 2);//29ban
  ellipse(0*angle, -30*angle, 3, 2);
  ellipse(30*angle, 0*angle, 3, 2);
  ellipse(-30*angle, 0*angle, 3, 2);

  ellipse(0*angle, 31*angle, 3, 2);//30ban
  ellipse(0*angle, -31*angle, 3, 2);
  ellipse(31*angle, 0*angle, 3, 2);
  ellipse(-31*angle, 0*angle, 3, 2);

  ellipse(0*angle, 32*angle, 3, 2);//31ban
  ellipse(0*angle, -32*angle, 3, 2);
  ellipse(32*angle, 0*angle, 3, 2);
  ellipse(-32*angle, 0*angle, 3, 2);

  ellipse(0*angle, 33*angle, 3, 2);//32ban
  ellipse(0*angle, -33*angle, 3, 2);
  ellipse(33*angle, 0*angle, 3, 2);
  ellipse(-33*angle, 0*angle, 3, 2);

  ellipse(0*angle, 34*angle, 3, 2);//33ban
  ellipse(0*angle, -34*angle, 3, 2);
  ellipse(34*angle, 0*angle, 3, 2);
  ellipse(-34*angle, 0*angle, 3, 2);

  ellipse(0*angle, 35*angle, 3, 2);//34ban
  ellipse(0*angle, -35*angle, 3, 2);
  ellipse(35*angle, 0*angle, 3, 2);
  ellipse(-35*angle, 0*angle, 3, 2);




  ellipse(1*angle, 1*angle, 3, 2);//migisita

  ellipse(7*angle, 7*angle, 3, 2);
  ellipse(8*angle, 8*angle, 3, 2);
  ellipse(9*angle, 9*angle, 3, 2);
  ellipse(10*angle, 10*angle, 3, 2);
  ellipse(11*angle, 11*angle, 3, 2);
  ellipse(12*angle, 12*angle, 3, 2);
  ellipse(13*angle, 13*angle, 3, 2);
  ellipse(14*angle, 14*angle, 3, 2);
  ellipse(15*angle, 15*angle, 3, 2);
  ellipse(16*angle, 16*angle, 3, 2);
  ellipse(17*angle, 17*angle, 3, 2);
  ellipse(18*angle, 18*angle, 3, 2);
  ellipse(19*angle, 19*angle, 3, 2);
  ellipse(20*angle, 20*angle, 3, 2);
  ellipse(21*angle, 21*angle, 3, 2);
  ellipse(22*angle, 22*angle, 3, 2);
  ellipse(23*angle, 23*angle, 3, 2);
  ellipse(24*angle, 24*angle, 3, 2);
  ellipse(25*angle, 25*angle, 3, 2);
  ellipse(26*angle, 26*angle, 3, 2);
  ellipse(27*angle, 27*angle, 3, 2);
  ellipse(28*angle, 28*angle, 3, 2);



  //  ellipse(-1*angle, 1*angle, 2, 2);//hidarisita1

  ellipse(-7*angle, 7*angle, 3, 2);
  ellipse(-8*angle, 8*angle, 3, 2);
  ellipse(-9*angle, 9*angle, 3, 2);
  ellipse(-10*angle, 10*angle, 3, 2);
  ellipse(-11*angle, 11*angle, 3, 2);
  ellipse(-12*angle, 12*angle, 3, 2);
  ellipse(-13*angle, 13*angle, 3, 2);
  ellipse(-14*angle, 14*angle, 3, 2);
  ellipse(-15*angle, 15*angle, 3, 2);
  ellipse(-16*angle, 16*angle, 3, 2);
  ellipse(-17*angle, 17*angle, 3, 2);
  ellipse(-18*angle, 18*angle, 3, 2);
  ellipse(-19*angle, 19*angle, 3, 2);
  ellipse(-20*angle, 20*angle, 3, 2);
  ellipse(-21*angle, 21*angle, 3, 2);
  ellipse(-22*angle, 22*angle, 3, 2);
  ellipse(-23*angle, 23*angle, 3, 2);
  ellipse(-24*angle, 24*angle, 3, 2);
  ellipse(-25*angle, 25*angle, 3, 2);
  ellipse(-26*angle, 26*angle, 3, 2);
  ellipse(-27*angle, 27*angle, 3, 2);
  ellipse(-28*angle, 28*angle, 3, 2);


  //  ellipse(1*angle, -1*angle, 2, 2);//migiue

  ellipse(7*angle, -7*angle, 3, 2);
  ellipse(8*angle, -8*angle, 3, 2);
  ellipse(9*angle, -9*angle, 3, 2);
  ellipse(10*angle, -10*angle, 3, 2);
  ellipse(11*angle, -11*angle, 3, 2);
  ellipse(12*angle, -12*angle, 3, 2);
  ellipse(13*angle, -13*angle, 3, 2);
  ellipse(14*angle, -14*angle, 3, 2);
  ellipse(15*angle, -15*angle, 3, 2);
  ellipse(16*angle, -16*angle, 3, 2);
  ellipse(17*angle, -17*angle, 3, 2);
  ellipse(18*angle, -18*angle, 3, 2);
  ellipse(19*angle, -19*angle, 3, 2);
  ellipse(20*angle, -20*angle, 3, 2);
  ellipse(21*angle, -21*angle, 3, 2);
  ellipse(22*angle, -22*angle, 3, 2);
  ellipse(23*angle, -23*angle, 3, 2);
  ellipse(24*angle, -24*angle, 3, 2);
  ellipse(25*angle, -25*angle, 3, 2);
  ellipse(26*angle, -26*angle, 3, 2);
  ellipse(27*angle, -27*angle, 3, 2);
  ellipse(28*angle, -28*angle, 3, 2);


  //  ellipse(-1*angle, -1*angle, 2, 2);//hidariue


  ellipse(-7*angle, -7*angle, 3, 2);
  ellipse(-8*angle, -8*angle, 3, 2);
  ellipse(-9*angle, -9*angle, 3, 2);
  ellipse(-10*angle, -10*angle, 3, 2);
  ellipse(-11*angle, -11*angle, 3 ,2);
  ellipse(-12*angle, -12*angle, 3, 2);
  ellipse(-13*angle, -13*angle, 3, 2);
  ellipse(-14*angle, -14*angle, 3, 2);
  ellipse(-15*angle, -15*angle, 3, 2);
  ellipse(-16*angle, -16*angle, 3, 2);
  ellipse(-17*angle, -17*angle, 3, 2);
  ellipse(-18*angle, -18*angle, 3, 2);
  ellipse(-19*angle, -19*angle, 3, 2);
  ellipse(-20*angle, -20*angle, 3, 2);
  ellipse(-21*angle, -21*angle, 3, 2);
  ellipse(-22*angle, -22*angle, 3, 2);
  ellipse(-23*angle, -23*angle, 3, 2);
  ellipse(-24*angle, -24*angle, 3, 2);
  ellipse(-25*angle, -25*angle, 3, 2);
  ellipse(-26*angle, -26*angle, 3, 2);
  ellipse(-27*angle, -27*angle, 3, 2);
  ellipse(-28*angle, -28*angle, 3, 2);


  //  ellipse(-1*angle, 2*angle, 2, 2);//hidarisita


  ellipse(-4.5*angle, 9*angle, 3, 2);
  ellipse(-5*angle, 10*angle, 3, 2);
  ellipse(-5.5*angle, 11*angle, 3, 2);
  ellipse(-6*angle, 12*angle, 3, 2);
  ellipse(-6.5*angle, 13*angle, 3, 2);
  ellipse(-7*angle, 14*angle, 3, 2);
  ellipse(-7.5*angle, 15*angle, 3, 2);
  ellipse(-8*angle, 16*angle, 3, 2);
  ellipse(-8.5*angle, 17*angle, 3, 2);
  ellipse(-9*angle, 18*angle, 3, 2);
  ellipse(-9.5*angle, 19*angle, 3, 2);
  ellipse(-10*angle, 20*angle, 3, 2);
  ellipse(-10.5*angle, 21*angle, 3, 2);
  ellipse(-11*angle, 22*angle, 3, 2);
  ellipse(-11.5*angle, 23*angle, 3, 2);
  ellipse(-12*angle, 24*angle, 3, 2);
  ellipse(-12.5*angle, 25*angle, 3, 2);
  ellipse(-13*angle, 26*angle, 3, 2);
  ellipse(-13.5*angle, 27*angle, 3, 2);
  ellipse(-14*angle, 28*angle, 3, 2);
  ellipse(-14.5*angle, 29*angle, 3, 2);
  ellipse(-15*angle, 30*angle, 3, 2);
  ellipse(-15.5*angle, 31*angle, 3, 2);
  ellipse(-16*angle, 32*angle, 3, 2);
  ellipse(-16.5*angle, 33*angle, 3, 2);


  //  ellipse(1*angle, -2*angle, 2, 2);//migiue


  ellipse(4.5*angle, -9*angle, 3, 2);
  ellipse(5*angle, -10*angle, 3, 2);
  ellipse(5.5*angle, -11*angle, 3, 2);
  ellipse(6*angle, -12*angle, 3, 2);
  ellipse(6.5*angle, -13*angle, 3, 2);
  ellipse(7*angle, -14*angle, 3, 2);
  ellipse(7.5*angle, -15*angle, 3, 2);
  ellipse(8*angle, -16*angle, 3, 2);
  ellipse(8.5*angle, -17*angle, 3, 2);
  ellipse(9*angle, -18*angle, 3, 2);
  ellipse(9.5*angle, -19*angle, 3, 2);
  ellipse(10*angle, -20*angle, 3, 2);
  ellipse(10.5*angle, -21*angle, 3, 2);
  ellipse(11*angle, -22*angle, 3, 2);
  ellipse(11.5*angle, -23*angle, 3, 2);
  ellipse(12*angle, -24*angle, 3, 2);
  ellipse(12.5*angle, -25*angle, 3, 2);
  ellipse(13*angle, -26*angle, 3, 2);
  ellipse(13.5*angle, -27*angle, 3, 2);
  ellipse(14*angle, -28*angle, 3, 2);
  ellipse(14.5*angle, -29*angle, 3, 2);
  ellipse(15*angle, -30*angle, 3, 2);
  ellipse(15.5*angle, -31*angle, 3, 2);
  ellipse(16*angle, -32*angle, 3, 2);
  ellipse(16.5*angle, -33*angle, 3, 2);


  //  ellipse(-1*angle, -2*angle, 2, 2);//hidarisita


  ellipse(-4.5*angle, -9*angle, 3, 2);
  ellipse(-5*angle, -10*angle, 3, 2);
  ellipse(-5.5*angle, -11*angle, 3, 2);
  ellipse(-6*angle, -12*angle, 3, 2);
  ellipse(-6.5*angle, -13*angle, 3, 2);
  ellipse(-7*angle, -14*angle, 3, 2);
  ellipse(-7.5*angle, -15*angle, 3, 2);
  ellipse(-8*angle, -16*angle, 3, 2);
  ellipse(-8.5*angle, -17*angle, 3, 2);
  ellipse(-9*angle, -18*angle, 3, 2);
  ellipse(-9.5*angle, -19*angle, 3, 2);
  ellipse(-10*angle, -20*angle, 3, 2);
  ellipse(-10.5*angle, -21*angle, 3, 2);
  ellipse(-11*angle, -22*angle, 3, 2);
  ellipse(-11.5*angle, -23*angle, 3, 2);
  ellipse(-12*angle, -24*angle, 3, 2);
  ellipse(-12.5*angle, -25*angle, 3, 2);
  ellipse(-13*angle, -26*angle, 3, 2);
  ellipse(-13.5*angle, -27*angle, 3, 2);
  ellipse(-14*angle, -28*angle, 3, 2);
  ellipse(-14.5*angle, -29*angle, 3, 2);
  ellipse(-15*angle, -30*angle, 3, 2);
  ellipse(-15.5*angle, -31*angle, 3, 2);
  ellipse(-16*angle, -32*angle, 3, 2);
  ellipse(-16.5*angle, -33*angle, 3, 2);


  //  ellipse(1*angle, 1*angle, 2, 2);//migisita


  ellipse(4.5*angle, 9*angle, 3, 2);
  ellipse(5*angle, 10*angle, 3, 2);
  ellipse(5.5*angle, 11*angle, 3, 2);
  ellipse(6*angle, 12*angle, 3, 2);
  ellipse(6.5*angle, 13*angle, 3, 2);
  ellipse(7*angle, 14*angle, 3, 2);
  ellipse(7.5*angle, 15*angle, 3, 2);
  ellipse(8*angle, 16*angle, 3, 2);
  ellipse(8.5*angle, 17*angle, 3, 2);
  ellipse(9*angle, 18*angle, 3, 2);
  ellipse(9.5*angle, 19*angle, 3, 2);
  ellipse(10*angle, 20*angle, 3, 2);
  ellipse(10.5*angle, 21*angle, 3, 2);
  ellipse(11*angle, 22*angle, 3, 2);
  ellipse(11.5*angle, 23*angle, 3, 2);
  ellipse(12*angle, 24*angle, 3, 2);
  ellipse(12.5*angle, 25*angle, 3, 2);
  ellipse(13*angle, 26*angle, 3, 2);
  ellipse(13.5*angle, 27*angle, 3, 2);
  ellipse(14*angle, 28*angle, 3, 2);
  ellipse(14.5*angle, 29*angle, 3, 2);
  ellipse(15*angle, 30*angle, 3, 2);
  ellipse(15.5*angle, 31*angle, 3, 2);
  ellipse(16*angle, 32*angle, 3, 2);
  ellipse(16.5*angle, 33*angle, 3, 2);

  //  ellipse(1.5*angle, 0.5*angle, 2, 2);//migisita


  ellipse(8.5*angle, 4*angle, 3, 2);
  ellipse(9.5*angle, 4.5*angle, 3, 2);
  ellipse(10.5*angle, 5*angle, 3, 2);
  ellipse(11.5*angle, 5.5*angle, 3, 2);
  ellipse(12.5*angle, 6*angle, 3, 2);
  ellipse(13.5*angle, 6.5*angle, 3, 2);
  ellipse(14.5*angle, 7*angle, 3, 2);
  ellipse(15.5*angle, 7.5*angle, 3, 2);
  ellipse(16.5*angle, 8*angle, 3, 2);
  ellipse(17.5*angle, 8.5*angle, 3, 2);
  ellipse(18.5*angle, 9*angle, 3, 2);
  ellipse(19.5*angle, 9.5*angle, 3, 2);
  ellipse(20.5*angle, 10*angle, 3, 2);
  ellipse(21.5*angle, 10.5*angle, 3, 2);
  ellipse(22.5*angle, 11*angle, 3, 2);
  ellipse(23.5*angle, 11.5*angle, 3, 2);
  ellipse(24.5*angle, 12*angle, 3, 2);
  ellipse(25.5*angle, 12.5*angle, 3, 2);
  ellipse(26.5*angle, 13*angle, 3, 2);
  ellipse(27.5*angle, 13.5*angle, 3, 2);
  ellipse(28.5*angle, 14*angle, 3, 2);
  ellipse(29.5*angle, 14.5*angle, 3, 2);
  ellipse(30.5*angle, 15*angle, 3, 2);
  ellipse(31.5*angle, 15.5*angle, 3, 2);
  ellipse(32.5*angle, 16*angle, 3, 2);


  //  ellipse(-1.5*angle, 0.5*angle, 2, 2);//hidarisita


  ellipse(-8.5*angle, 4*angle, 3, 2);
  ellipse(-9.5*angle, 4.5*angle, 3, 2);
  ellipse(-10.5*angle, 5*angle, 3, 2);
  ellipse(-11.5*angle, 5.5*angle, 3, 2);
  ellipse(-12.5*angle, 6*angle, 3, 2);
  ellipse(-13.5*angle, 6.5*angle, 3, 2);
  ellipse(-14.5*angle, 7*angle, 3, 2);
  ellipse(-15.5*angle, 7.5*angle, 3, 2);
  ellipse(-16.5*angle, 8*angle, 3, 2);
  ellipse(-17.5*angle, 8.5*angle, 3, 2);
  ellipse(-18.5*angle, 9*angle, 3, 2);
  ellipse(-19.5*angle, 9.5*angle, 3, 2);
  ellipse(-20.5*angle, 10*angle, 3, 2);
  ellipse(-21.5*angle, 10.5*angle, 3, 2);
  ellipse(-22.5*angle, 11*angle, 3, 2);
  ellipse(-23.5*angle, 11.5*angle, 3, 2);
  ellipse(-24.5*angle, 12*angle, 3, 2);
  ellipse(-25.5*angle, 12.5*angle, 3, 2);
  ellipse(-26.5*angle, 13*angle, 3, 2);
  ellipse(-27.5*angle, 13.5*angle, 3, 2);
  ellipse(-28.5*angle, 14*angle, 3, 2);
  ellipse(-29.5*angle, 14.5*angle, 3, 2);
  ellipse(-30.5*angle, 15*angle, 3, 2);
  ellipse(-31.5*angle, 15.5*angle, 3, 2);
  ellipse(-32.5*angle, 16*angle, 3, 2);


  //  ellipse(-1.5*angle, -0.5*angle, 2, 2);//hidariue


  ellipse(-8.5*angle, -4*angle, 3, 2);
  ellipse(-9.5*angle, -4.5*angle, 3, 2);
  ellipse(-10.5*angle, -5*angle, 3, 2);
  ellipse(-11.5*angle, -5.5*angle, 3, 2);
  ellipse(-12.5*angle, -6*angle, 3, 2);
  ellipse(-13.5*angle, -6.5*angle, 3, 2);
  ellipse(-14.5*angle, -7*angle, 3, 2);
  ellipse(-15.5*angle, -7.5*angle, 3, 2);
  ellipse(-16.5*angle, -8*angle, 3, 2);
  ellipse(-17.5*angle, -8.5*angle, 3, 2);
  ellipse(-18.5*angle, -9*angle, 3, 2);
  ellipse(-19.5*angle, -9.5*angle, 3, 2);
  ellipse(-20.5*angle, -10*angle, 3, 2);
  ellipse(-21.5*angle, -10.5*angle, 3, 2);
  ellipse(-22.5*angle, -11*angle, 3, 2);
  ellipse(-23.5*angle, -11.5*angle, 3, 2);
  ellipse(-24.5*angle, -12*angle, 3, 2);
  ellipse(-25.5*angle, -12.5*angle, 3, 2);
  ellipse(-26.5*angle, -13*angle, 3, 2);
  ellipse(-27.5*angle, -13.5*angle, 3, 2);
  ellipse(-28.5*angle, -14*angle, 3, 2);
  ellipse(-29.5*angle, -14.5*angle, 3, 2);
  ellipse(-30.5*angle, -15*angle, 3, 2);
  ellipse(-31.5*angle, -15.5*angle, 3, 2);
  ellipse(-32.5*angle, -16*angle, 3, 2);


  //  ellipse(1.5*angle, -0.5*angle, 2, 2);//migiue


  ellipse(8.5*angle, -4*angle, 3, 2);
  ellipse(9.5*angle, -4.5*angle, 3, 2);
  ellipse(10.5*angle, -5*angle, 3, 2);
  ellipse(11.5*angle, -5.5*angle, 3, 2);
  ellipse(12.5*angle, -6*angle, 3, 2);
  ellipse(13.5*angle, -6.5*angle, 3, 2);
  ellipse(14.5*angle, -7*angle, 3, 2);
  ellipse(15.5*angle, -7.5*angle, 3, 2);
  ellipse(16.5*angle, -8*angle, 3, 2);
  ellipse(17.5*angle, -8.5*angle, 3, 2);
  ellipse(18.5*angle, -9*angle, 3, 2);
  ellipse(19.5*angle, -9.5*angle, 3, 2);
  ellipse(20.5*angle, -10*angle, 3, 2);
  ellipse(21.5*angle, -10.5*angle, 3, 2);
  ellipse(22.5*angle, -11*angle, 3, 2);
  ellipse(23.5*angle, -11.5*angle, 3, 2);
  ellipse(24.5*angle, -12*angle, 3, 2);
  ellipse(25.5*angle, -12.5*angle, 3, 2);
  ellipse(26.5*angle, -13*angle, 3, 2);
  ellipse(27.5*angle, -13.5*angle, 3, 2);
  ellipse(28.5*angle, -14*angle, 3, 2);
  ellipse(29.5*angle, -14.5*angle, 3, 2);
  ellipse(30.5*angle, -15*angle, 3, 2);
  ellipse(31.5*angle, -15.5*angle, 3, 2);
  ellipse(32.5*angle, -16*angle, 3, 2);


  ellipse(-3*angle, -0.5*angle, 3, 2);//hidariue
  ellipse(-4*angle, -0.7*angle, 3, 2);
  ellipse(-5*angle, -0.9*angle, 3, 2);
  ellipse(-6*angle, -1.1*angle, 3, 2);
  ellipse(-7*angle, -1.3*angle, 3, 2);
  ellipse(-8*angle, -1.5*angle, 3, 2);
  ellipse(-9*angle, -1.7*angle, 3, 2);
  ellipse(-10*angle, -1.9*angle, 3, 2);
  ellipse(-11*angle, -2.1*angle, 3, 2);
  ellipse(-12*angle, -2.3*angle, 3, 2);
  ellipse(-13*angle, -2.5*angle, 3, 2);
  ellipse(-14*angle, -2.7*angle, 3, 2);
  ellipse(-15*angle, -2.9*angle, 3, 2);
  ellipse(-16*angle, -3.1*angle, 3, 2);
  ellipse(-17*angle, -3.3*angle, 3, 2);
  ellipse(-18*angle, -3.5*angle, 3, 2);
  ellipse(-19*angle, -3.7*angle, 3, 2);
  ellipse(-20*angle, -3.9*angle, 3, 2);
  ellipse(-21*angle, -4.1*angle, 3, 2);
  ellipse(-22*angle, -4.3*angle, 3, 2);
  ellipse(-23*angle, -4.5*angle, 3, 2);
  ellipse(-24*angle, -4.7*angle, 3, 2);
  ellipse(-25*angle, -4.9*angle, 3, 2);
  ellipse(-26*angle, -5.1*angle, 3, 2);
  ellipse(-27*angle, -5.3*angle, 3, 2);
  ellipse(-28*angle, -5.5*angle, 3, 2);
  ellipse(-29*angle, -5.7*angle, 3, 2);
  ellipse(-30*angle, -5.9*angle, 3, 2);
  ellipse(-31*angle, -6.1*angle, 3, 2);
  ellipse(-32*angle, -6.3*angle, 3, 2);
  ellipse(-33*angle, -6.5*angle, 3, 2);
  ellipse(-34*angle, -6.7*angle, 3, 2);
  ellipse(-35*angle, -6.9*angle, 3, 2);

  ellipse(3*angle, -0.5*angle, 3, 2);//migiue
  ellipse(4*angle, -0.7*angle, 3, 2);
  ellipse(5*angle, -0.9*angle, 3, 2);
  ellipse(6*angle, -1.1*angle, 3, 2);
  ellipse(7*angle, -1.3*angle, 3, 2);
  ellipse(8*angle, -1.5*angle, 3, 2);
  ellipse(9*angle, -1.7*angle, 3, 2);
  ellipse(10*angle, -1.9*angle, 3, 2);
  ellipse(11*angle, -2.1*angle, 3, 2);
  ellipse(12*angle, -2.3*angle, 3, 2);
  ellipse(13*angle, -2.5*angle, 3, 2);
  ellipse(14*angle, -2.7*angle, 3, 2);
  ellipse(15*angle, -2.9*angle, 3, 2);
  ellipse(16*angle, -3.1*angle, 3, 2);
  ellipse(17*angle, -3.3*angle, 3, 2);
  ellipse(18*angle, -3.5*angle, 3, 2);
  ellipse(19*angle, -3.7*angle, 3, 2);
  ellipse(20*angle, -3.9*angle, 3, 2);
  ellipse(21*angle, -4.1*angle, 3, 2);
  ellipse(22*angle, -4.3*angle, 3, 2);
  ellipse(23*angle, -4.5*angle, 3, 2);
  ellipse(24*angle, -4.7*angle, 3, 2);
  ellipse(25*angle, -4.9*angle, 3, 2);
  ellipse(26*angle, -5.1*angle, 3, 2);
  ellipse(27*angle, -5.3*angle, 3, 2);
  ellipse(28*angle, -5.5*angle, 3, 2);
  ellipse(29*angle, -5.7*angle, 3, 2);
  ellipse(30*angle, -5.9*angle, 3, 2);
  ellipse(31*angle, -6.1*angle, 3, 2);
  ellipse(32*angle, -6.3*angle, 3, 2);
  ellipse(33*angle, -6.5*angle, 3, 2);
  ellipse(34*angle, -6.7*angle, 3, 2);
  ellipse(35*angle, -6.9*angle, 3, 2);
  
  ellipse(3*angle, 0.5*angle, 3, 2);//migisita
  ellipse(4*angle, 0.7*angle, 3, 2);
  ellipse(5*angle, 0.9*angle, 3, 2);
  ellipse(6*angle, 1.1*angle, 3, 2);
  ellipse(7*angle, 1.3*angle, 3, 2);
  ellipse(8*angle, 1.5*angle, 3, 2);
  ellipse(9*angle, 1.7*angle, 3, 2);
  ellipse(10*angle, 1.9*angle, 3, 2);
  ellipse(11*angle, 2.1*angle, 3, 2);
  ellipse(12*angle, 2.3*angle, 3, 2);
  ellipse(13*angle, 2.5*angle, 3, 2);
  ellipse(14*angle, 2.7*angle, 3, 2);
  ellipse(15*angle, 2.9*angle, 3, 2);
  ellipse(16*angle, 3.1*angle, 3, 2);
  ellipse(17*angle, 3.3*angle, 3, 2);
  ellipse(18*angle, 3.5*angle, 3, 2);
  ellipse(19*angle, 3.7*angle, 3, 2);
  ellipse(20*angle, 3.9*angle, 3, 2);
  ellipse(21*angle, 4.1*angle, 3, 2);
  ellipse(22*angle, 4.3*angle, 3, 2);
  ellipse(23*angle, 4.5*angle, 3, 2);
  ellipse(24*angle, 4.7*angle, 3, 2);
  ellipse(25*angle, 4.9*angle, 3, 2);
  ellipse(26*angle, 5.1*angle, 3, 2);
  ellipse(27*angle, 5.3*angle, 3, 2);
  ellipse(28*angle, 5.5*angle, 3, 2);
  ellipse(29*angle, 5.7*angle, 3, 2);
  ellipse(30*angle, 5.9*angle, 3, 2);
  ellipse(31*angle, 6.1*angle, 3, 2);
  ellipse(32*angle, 6.3*angle, 3, 2);
  ellipse(33*angle, 6.5*angle, 3, 2);
  ellipse(34*angle, 6.7*angle, 3, 2);
  ellipse(35*angle, 6.9*angle, 3, 2);

  ellipse(-3*angle, 0.5*angle, 3, 2);//hidarisita
  ellipse(-4*angle, 0.7*angle, 3, 2);
  ellipse(-5*angle, 0.9*angle, 3, 2);
  ellipse(-6*angle, 1.1*angle, 3, 2);
  ellipse(-7*angle, 1.3*angle, 3, 2);
  ellipse(-8*angle, 1.5*angle, 3, 2);
  ellipse(-9*angle, 1.7*angle, 3, 2);
  ellipse(-10*angle, 1.9*angle, 3, 2);
  ellipse(-11*angle, 2.1*angle, 3, 2);
  ellipse(-12*angle, 2.3*angle, 3, 2);
  ellipse(-13*angle, 2.5*angle, 3, 2);
  ellipse(-14*angle, 2.7*angle, 3, 2);
  ellipse(-15*angle, 2.9*angle, 3, 2);
  ellipse(-16*angle, 3.1*angle, 3, 2);
  ellipse(-17*angle, 3.3*angle, 3, 2);
  ellipse(-18*angle, 3.5*angle, 3, 2);
  ellipse(-19*angle, 3.7*angle, 3, 2);
  ellipse(-20*angle, 3.9*angle, 3, 2);
  ellipse(-21*angle, 4.1*angle, 3, 2);
  ellipse(-22*angle, 4.3*angle, 3, 2);
  ellipse(-23*angle, 4.5*angle, 3, 2);
  ellipse(-24*angle, 4.7*angle, 3, 2);
  ellipse(-25*angle, 4.9*angle, 3, 2);
  ellipse(-26*angle, 5.1*angle, 3, 2);
  ellipse(-27*angle, 5.3*angle, 3, 2);
  ellipse(-28*angle, 5.5*angle, 3, 2);
  ellipse(-29*angle, 5.7*angle, 3, 2);
  ellipse(-30*angle, 5.9*angle, 3, 2);
  ellipse(-31*angle, 6.1*angle, 3, 2);
  ellipse(-32*angle, 6.3*angle, 3, 2);
  ellipse(-33*angle, 6.5*angle, 3, 2);
  ellipse(-34*angle, 6.7*angle, 3, 2);
  ellipse(-35*angle, 6.9*angle, 3, 2);

  ellipse(1*angle, -4*angle, 3, 2);//migiue
  ellipse(1.2*angle, -5*angle, 3, 2);
  ellipse(1.4*angle, -6*angle, 3, 2);
  ellipse(1.6*angle, -7*angle, 3, 2);
  ellipse(1.8*angle, -8*angle, 3, 2);
  ellipse(2.0*angle, -9*angle, 3, 2);
  ellipse(2.2*angle, -10*angle, 3, 2);
  ellipse(2.4*angle, -11*angle, 3, 2);
  ellipse(2.6*angle, -12*angle, 3, 2);
  ellipse(2.8*angle, -13*angle, 3, 2);
  ellipse(3*angle, -14*angle, 3, 2);
  ellipse(3.2*angle, -15*angle, 3, 2);
  ellipse(3.4*angle, -16*angle, 3, 2);
  ellipse(3.6*angle, -17*angle, 3, 2);
  ellipse(3.8*angle, -18*angle, 3, 2);
  ellipse(4*angle, -19*angle, 3, 2);
  ellipse(4.2*angle, -20*angle, 3, 2);
  ellipse(4.4*angle, -21*angle, 3, 2);
  ellipse(4.6*angle, -22*angle, 3, 2);
  ellipse(4.8*angle, -23*angle, 3, 2);
  ellipse(5*angle, -24*angle, 3, 2);
  ellipse(5.2*angle, -25*angle, 3, 2);
  ellipse(5.4*angle, -26*angle, 3, 2);
  ellipse(5.6*angle, -27*angle, 3, 2);
  ellipse(5.8*angle, -28*angle, 3, 2);
  ellipse(6*angle, -29*angle, 3, 2);
  ellipse(6.2*angle, -30*angle, 3, 2);
  ellipse(6.4*angle, -31*angle, 3, 2);
  ellipse(6.6*angle, -32*angle, 3, 2);
  ellipse(6.8*angle, -33*angle, 3, 2);
  ellipse(7*angle, -34*angle, 3, 2);
  ellipse(7.2*angle, -35*angle, 3, 2);

  ellipse(-1*angle, -4*angle, 3, 2);//hidariue
  ellipse(-1.2*angle, -5*angle, 3, 2);
  ellipse(-1.4*angle, -6*angle, 3, 2);
  ellipse(-1.6*angle, -7*angle, 3, 2);
  ellipse(-1.8*angle, -8*angle, 3, 2);
  ellipse(-2.0*angle, -9*angle, 3, 2);
  ellipse(-2.2*angle, -10*angle, 3, 2);
  ellipse(-2.4*angle, -11*angle, 3, 2);
  ellipse(-2.6*angle, -12*angle, 3, 2);
  ellipse(-2.8*angle, -13*angle, 3, 2);
  ellipse(-3*angle, -14*angle, 3, 2);
  ellipse(-3.2*angle, -15*angle, 3, 2);
  ellipse(-3.4*angle, -16*angle, 3, 2);
  ellipse(-3.6*angle, -17*angle, 3, 2);
  ellipse(-3.8*angle, -18*angle, 3, 2);
  ellipse(-4*angle, -19*angle, 3, 2);
  ellipse(-4.2*angle, -20*angle, 3, 2);
  ellipse(-4.4*angle, -21*angle, 3, 2);
  ellipse(-4.6*angle, -22*angle, 3, 2);
  ellipse(-4.8*angle, -23*angle, 3, 2);
  ellipse(-5*angle, -24*angle, 3, 2);
  ellipse(-5.2*angle, -25*angle, 3, 2);
  ellipse(-5.4*angle, -26*angle, 3, 2);
  ellipse(-5.6*angle, -27*angle, 3, 2);
  ellipse(-5.8*angle, -28*angle, 3, 2);
  ellipse(-6*angle, -29*angle, 3, 2);
  ellipse(-6.2*angle, -30*angle, 3, 2);
  ellipse(-6.4*angle, -31*angle, 3, 2);
  ellipse(-6.6*angle, -32*angle, 3, 2);
  ellipse(-6.8*angle, -33*angle, 3, 2);
  ellipse(-7*angle, -34*angle, 3, 2);
  ellipse(-7.2*angle, -35*angle, 3, 2);

  ellipse(-1*angle, 4*angle, 3, 2);//hidarisita
  ellipse(-1.2*angle, 5*angle, 3, 2);
  ellipse(-1.4*angle, 6*angle, 3, 2);
  ellipse(-1.6*angle, 7*angle, 3, 2);
  ellipse(-1.8*angle, 8*angle, 3, 2);
  ellipse(-2.0*angle, 9*angle, 3, 2);
  ellipse(-2.2*angle, 10*angle, 3, 2);
  ellipse(-2.4*angle, 11*angle, 3, 2);
  ellipse(-2.6*angle, 12*angle, 3, 2);
  ellipse(-2.8*angle, 13*angle, 3, 2);
  ellipse(-3*angle, 14*angle, 3, 2);
  ellipse(-3.2*angle, 15*angle, 3, 2);
  ellipse(-3.4*angle, 16*angle, 3, 2);
  ellipse(-3.6*angle, 17*angle, 3, 2);
  ellipse(-3.8*angle, 18*angle, 3, 2);
  ellipse(-4*angle, 19*angle, 3, 2);
  ellipse(-4.2*angle, 20*angle, 3, 2);
  ellipse(-4.4*angle, 21*angle, 3, 2);
  ellipse(-4.6*angle, 22*angle, 3, 2);
  ellipse(-4.8*angle, 23*angle, 3, 2);
  ellipse(-5*angle, 24*angle, 3, 2);
  ellipse(-5.2*angle, 25*angle, 3, 2);
  ellipse(-5.4*angle, 26*angle, 3, 2);
  ellipse(-5.6*angle, 27*angle, 3, 2);
  ellipse(-5.8*angle, 28*angle, 3, 2);
  ellipse(-6*angle, 29*angle, 3, 2);
  ellipse(-6.2*angle, 30*angle, 3, 2);
  ellipse(-6.4*angle, 31*angle, 3, 2);
  ellipse(-6.6*angle, 32*angle, 3, 2);
  ellipse(-6.8*angle, 33*angle, 3, 2);
  ellipse(-7*angle, 34*angle, 3, 2);
  ellipse(-7.2*angle, 35*angle, 3, 2);

  ellipse(1*angle, 4*angle, 3, 2);//migisita
  ellipse(1.2*angle, 5*angle, 3, 2);
  ellipse(1.4*angle, 6*angle, 3, 2);
  ellipse(1.6*angle, 7*angle, 3, 2);
  ellipse(1.8*angle, 8*angle, 3, 2);
  ellipse(2.0*angle, 9*angle, 2, 2);
  ellipse(2.2*angle, 10*angle, 3, 2);
  ellipse(2.4*angle, 11*angle, 3, 2);
  ellipse(2.6*angle, 12*angle, 3, 2);
  ellipse(2.8*angle, 13*angle, 3, 2);
  ellipse(3*angle, 14*angle, 3, 2);
  ellipse(3.2*angle, 15*angle, 3, 2);
  ellipse(3.4*angle, 16*angle, 3, 2);
  ellipse(3.6*angle, 17*angle, 3, 2);
  ellipse(3.8*angle, 18*angle, 3, 2);
  ellipse(4*angle, 19*angle, 3, 2);
  ellipse(4.2*angle, 20*angle, 3, 2);
  ellipse(4.4*angle, 21*angle, 3, 2);
  ellipse(4.6*angle, 22*angle, 3, 2);
  ellipse(4.8*angle, 23*angle, 3, 2);
  ellipse(5*angle, 24*angle, 3, 2);
  ellipse(5.2*angle, 25*angle, 3, 2);
  ellipse(5.4*angle, 26*angle, 3, 2);
  ellipse(5.6*angle, 27*angle, 3, 2);
  ellipse(5.8*angle, 28*angle, 3, 2);
  ellipse(6*angle, 29*angle, 3, 2);
  ellipse(6.2*angle, 30*angle, 3, 2);
  ellipse(6.4*angle, 31*angle, 3, 2);
  ellipse(6.6*angle, 32*angle, 3, 2);
  ellipse(6.8*angle, 33*angle, 3, 2);
  ellipse(7*angle, 34*angle, 3, 2);
  ellipse(7.2*angle, 35*angle, 3, 2);


  popMatrix();

}

