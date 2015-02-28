
import ddf.minim.*;

Minim minim;
AudioInput in;
AudioOutput out;
PlayBack pb;
float[] samples = new float[0];
boolean record = false;
int bufferSize = 1280;
int newBufferSize = bufferSize;



//////for new stuff
//boolean isrecording;
//////

float scalar = 5;
int transX = 400;
int transY = 400;




void setup()
{

  smooth();
  size(1280, 800, P3D);

  minim = new Minim(this);
  minim.debugOn();

  pb = new PlayBack();

  // get a line in from Minim, default bit depth is 16
  in = minim.getLineIn(Minim.MONO, bufferSize);

  // get a line out from Minim, default sample rate is 44100, default bit depth is 16
  out = minim.getLineOut(Minim.MONO, bufferSize);
  out.addSignal(pb);

  for (int i = 0; i < samples.length; i++) {
    samples[i] = 0.0;
  }

  fill(0);
  rect(-transX*scalar,-transY*scalar,width*scalar,height*scalar); 

}

void draw()
{


  translate(transX, transY);
  scale(1/scalar); 


  smooth();
  fill(0,50);
  noStroke();
  rect(-transX*scalar,-transY*scalar,width*scalar,height*scalar); 
  colorMode(HSB);
  //background(0);
  stroke(255);
  // draw the waveforms

  for(int i= 0; i < in.bufferSize() - 1; i++)
  {
    //float value = in.left.get(i);
    float value = in.left.get(i);
    float valueNext=  in.left.get(i+1);


    float h = map(value, -.2, .2, 0, 360);
    float s = map(value, -.2, .2, 60, 360);

    stroke(h,s,360);
    // inverted
    //line(i, 400 +100/(value*500), i+50, 400 + 100/(valueNext*5));
    // shifted
    //line(i, 400 +(value*500), i+100, 400 + (valueNext*5));
    //
    pushMatrix();
    // 

    translate(value+1250,valueNext);
    rotate(value*100);
    line(i, 400 +(value*1500), i+1, 400 + (valueNext*5));
    popMatrix();


    pushMatrix();
    // 
    scale(.5);
    translate(value-1500,valueNext);
    rotate(value*(-10));
    line(i, 400 +(value*100), i+1, 400 + (valueNext*5));
    popMatrix();

    pushMatrix();
    // 
    scale(.5);
    translate(value+6500,valueNext);
    rotate(value*50);
    line(i, 400 +(value*100), i+1, 400 + (valueNext*5));
    popMatrix();



    /////top layer

    pushMatrix();

    stroke(h,s,360,20);

    translate(value-1300,valueNext);



    translate(value-1300,valueNext);

    line(i, 400 +100/(value*5), i+50, 400 + 100/(valueNext*5));


    translate(value+1300,valueNext);

    line(i, 400 +100/(value*5), i+50, 400 + 100/(valueNext*5));

    translate(value+1300,valueNext);

    line(i, 400 +100/(value*5), i+50, 400 + 100/(valueNext*5));

    translate(value+1300,valueNext);

    line(i, 400 +100/(value*5), i+50, 400 + 100/(valueNext*5));

    translate(value+1300,valueNext);

    line(i, 400 +100/(value*5), i+50, 400 + 100/(valueNext*5));

    translate(value+1300,valueNext);

    line(i, 400 +100/(value*5), i+50, 400 + 100/(valueNext*5));



    popMatrix();

    pushMatrix();
    rotate(45);
    translate(value,valueNext);
    line(i, 400 +(value*50), i+.1, 400 + (valueNext*5));

    popMatrix();

  }



  if (record == true) {
    // Increase the size of samples[] to accomodate the new sound data
    int samplesOriginalLength = samples.length;
    print(samplesOriginalLength);
    samples = expand(samples, newBufferSize);
    println("-" + samples.length);
    // Copy the new data into samples
    //samples = concat(samples, in.left);
    for(int i = 0; i < in.bufferSize(); i++) {
      samples[samplesOriginalLength+i] = in.left.get(i);
    }
    newBufferSize += bufferSize;
  }
}

int samplesPlayHead = 0;

class PlayBack implements AudioSignal{
  void generate(float[] samp) {
    //for(int i = 0; i < in.bufferSize() - 1; i++) {
    //  samp[i] = in.left.get(i);
    //}

    if (samples.length != 0) {
      for (int i = 0; i < bufferSize; i++) {
        samp[i] = samples[samplesPlayHead + i];
      }
      samplesPlayHead += bufferSize;
      if (samplesPlayHead >= samples.length) {
        samplesPlayHead = 0;
      }
    }
  }
  // this is a stricly mono signal
  void generate(float[] left, float[] right)
  {
    generate(left);
    generate(right);
  }

}

//////////////////////////////////////////////for new stuff


/* if( isrecording== false){
 
 isrecording=true;
 
 if(count>1){
 opencv2.movie("drawing" + (count-1) + ".mov" );
 }
 
 count++;
 println(count);
 }
 
 
 if(isrecording==true){
 
 mm.addFrame();
 
 
 if(faces.length==0 ){
 mm.finish();
 isrecording=false; 
 }
 
 }
 */
/////////////////////////////////////////////



void keyPressed() {
  if (key == ' ') {
    record = true;
  }
}

void keyReleased() {
  if (key == ' ') {
    record = false;
  }
}


void stop() {
  // always close Minim audio classes when you are done with them
  in.close();
  minim.stop();
  super.stop();
}





