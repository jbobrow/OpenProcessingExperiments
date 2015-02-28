
void setup(){
size (600,550);
background (240,235,191);
}


void draw(){
//clock, wrist band low
fill(0,0,0);
beginShape ();
vertex (250,50);
vertex (350,50);
vertex (350,200);
vertex (250,200);
vertex (250,50);
endShape();

//clock, wrist band upper
fill(0,0,0);
beginShape ();
vertex (250,320);
vertex (350,320);
vertex (350,470);
vertex (250,470);
vertex (250,320);
endShape ();


//outer frame of clock, square 1
fill(0,0,0);
beginShape ();
vertex (350,200);
vertex (360,200);
vertex (360,210);
vertex (350,210);
vertex (350,200);
endShape ();

//outer frame of clock, square 2
fill(0,0,0);
beginShape ();
vertex (350,310);
vertex (360,310);
vertex (360,320);
vertex (350,320);
vertex (350,310);
endShape ();

//outer frame of clock, square 3
fill(0,0,0);
beginShape ();
vertex (250,310);
vertex (250,320);
vertex (240,320);
vertex (240,310);
vertex (250,310);
endShape ();

//outer frame of clock, square 4
fill(0,0,0);
beginShape ();
vertex (250,220);
vertex (250,210);
vertex (240,210);
vertex (240,220);
vertex (250,220);
endShape ();

//outer frame of clock, ride side
fill(0,0,0);
beginShape();
vertex (360,210);
vertex (370,210);
vertex (370,310);
vertex (360,310);
vertex (360,210);
endShape();

//dial
fill(0,0,0);
beginShape();
vertex (360,247.5);
vertex (380,247.5);
vertex (380,272.5);
vertex (360,272.5);
vertex (360,247.5);
endShape();

//outer frame of clock, left side
fill(0,0,0);
beginShape();
vertex (230,210);
vertex (240,210);
vertex (240,310);
vertex (230,310);
vertex (230,210);
endShape();

//white box 
fill(255,255,255);
beginShape ();
vertex (250,200);
vertex (350,200);
vertex (350,210);
vertex (360,210);
vertex (360,310);
vertex (350,310);
vertex (350,320);
vertex (250,320);
vertex (250,310);
vertex (240,310);
vertex (240,210);
vertex (250,210);
vertex (250,200);
endShape ();

//hour hand
fill(0,0,0);
beginShape ();
vertex (293.75,210);
vertex (306.25,210);
vertex (306.25,260);
vertex (293.75,260);
vertex (293.75,210);
endShape ();

//minute hand
smooth();
fill(0,0,0);
beginShape();
vertex (293.75,260);
vertex (306.25,260);
vertex (325.5,301.2);
vertex (316.7,310);
vertex (293.75,260);
endShape();


}

