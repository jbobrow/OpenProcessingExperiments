



import processing.pdf.*;        //import PDF library
boolean record;                //create a boolean to turn recording on/off

void setup () {
size (480, 720);
background (109,39,40);
}

void draw () {
if (record) {                                            //use an if statement to start recording
beginRecord(PDF, "frame-####.pdf");                      // Note that #### will be replaced with the frame number. Fancy!
}

rectMode (CENTER);


noFill();
stroke (0,31,0);
strokeWeight (30);

rect (width/2, height/2, width, height);              //outer rectangle
strokeWeight (20);                                     //thick line


for (int i = 1; i < 5; i++) {                            //draw rectangles
rect (width/2, height/2, width -i*120, height-i*120);
}

noFill();
stroke (203,80,50);
strokeWeight (8);

rect (width/2, height/2, width, height);              //outer rectangle
strokeWeight (8);       

for (int i = 1; i < 9; i++) {                            //draw rectangles
rect (width/2, height/2, width -i*60, height-i*60);
}


noFill();
stroke (255);
strokeWeight (2);

rect (width/2, height/2, width, height);              //outer rectangle
strokeWeight (2);       

for (int i = 1; i < 9; i++) {                            //draw rectangles
rect (width/2, height/2, width -i*60, height-i*60);
}


//use an if statement to stop recording and turn recording off
if (record) {
endRecord();
record = false;
}

}
//if you press a key, a pdf will be recorded
void keyPressed () {
record = true;
}
