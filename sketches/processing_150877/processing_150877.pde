
Data y;
Data y1;
Table table;

PFont myFont;
int alpha = 0; //alpha er prikkernes lysværdi. 
int hourly = int(10); //timeligt opdateret data, nedkogt til dens 'aktivitetsværdi'
int twitch; //twitch er en random-værdi der hjælper med at lave en timelang performance af den seneste hourly-værdi
float val2;
float val1;
int d;
float amp = 0;

// sound stuff

import ddf.minim.*;
import ddf.minim.ugens.*;

Minim       minim;
AudioOutput out;
NoiseInstrument noise;
// /soundstuff


void setup() {
  size(800, 600);
  background(0);
  //tring[] fontList = PFont.list();
  //println(fontList);

  myFont = createFont("Helvetica-Bold", 40, true);
  textFont(myFont);
  textAlign(LEFT, CENTER);
  fill(255);
  text("", 50, height-60);
  noStroke();

  minim = new Minim(this);
  out = minim.getLineOut(Minim.MONO, 128); // use the getLineOut method of the Minim object to get an AudioOutput object
  //myWhiteNoise = new NoiseInstrument( amp, Noise.Tint.WHITE );
}

void draw() {

  noise = new NoiseInstrument( amp, Noise.Tint.RED );
  out.playNote( 0, 0.2, noise );

  if (d == 200) {                    // Tæller op til 200, når 200 er fundet, da spytter den vores nyeste tal ud fra vores datasæt.
    //Spørge severen om et eller andet

    String url = "http://www2.dmu.dk/atmosphericenvironment/byer/hcab.csv"; //Henter data fra data KK
    y = new Data(url);

    String url1 = "http://data.kk.dk/storage/f/datakkdk/Bef_Kbh_Alder_Koen_Civst.csv";
    y1 = new Data(url1);

    println(y.getParameter());
    println(y1.getParameter());


    if (y.getParameter() >val1 || y.getParameter() <val1) {  // Vi giver val1 den nyeste værdi fra dataKK og spørger om denne er mindre eller større end den forhenværende værdi.
      hourly=int(random(1, 10));
      val1=y.getParameter();      // Her giver vi den nyligt fundne værdi til val1, så det igen er muligt at sammenligne med det nye tal som kommer efter en time.
    }
    if (y1.getParameter() >val2 || y1.getParameter() <val2) {
      hourly=int(random(1, 10));
      val2 = y1.getParameter();
    }

    d = 0;
  }

  d = d + 1;              //Tæller op - hænger sammen med if sætningen "if(d = 200)"
  println(d);

  float white = int(alpha);

  if (alpha>25) { //diminishing returns. Dette loop sørger for at lyset falder ned igen, langsomt(minus 15 per frame)
    alpha=alpha-15;
  }

  float fractionWidth = white/(width/2); //fractionWidth tager alpha(op til 255), og dividerer den med halvdelen af skærmens bredde. På den måde er helt ude i siden = 0 alpha, og midten af skærmen = 255 alpha

  float fractionHeight = white/(height/2); //samme med højden


  for (int i = 10; i < width-10; i = i+10) { //laver pixels hver 10'ende pixel, horisontalt [ændr sidste værdi hvis det lagger, højere, færre prikker]

    for (int j = 10; j < height-10; j = j+10) { // vertikalt, resulterende i et pixelgrid [ændr sidste værdi hvis det lagger, højere, færre prikker]


      if (i<=width/2) { //hvis pixel er på venstre side af skærmen

        float alphaWidth = fractionWidth*i; //alphaWidth er hvid, divideret med antallet af pixels på halvdelen af skærmens bredde, derefter ganget med i

          if (j<height/2) { //hvis pixel er over midten (og på venstre side)

          float alphaHeight = fractionHeight*j; 
          int r = int(random(-30, 30));

          if (alphaHeight<alphaWidth) { //hvis pixel er længere oppe end den er til venstre
            fill(alphaHeight+r); //dominerer højdeværdien
          }

          else {
            fill(alphaWidth+r);
          }
        }

        else if (j>height/2) { //hvis pixel er under midten 

          float alphaHeight = fractionHeight*(height-j);
          int r = int(random(-30, 30));

          if (alphaHeight<alphaWidth) { //hvis pixel er længere nede end den er til venstre
            fill(alphaHeight+r);
          }

          else {
            fill(alphaWidth+r);
          }
        }

        else {
          int r = int(random(-30, 30));
          fill(alphaWidth+r);
        }
      }

      else if (i>width/2) { //hvis pixel er på højre side

        float alphaWidth = fractionWidth*(width-i);

        if (j<height/2) { //hvis pixel er over midten

          float alphaHeight = fractionHeight*j; 
          int r = int(random(-30, 30));
          if (alphaHeight<alphaWidth) { //hvis pixel er længere oppe end den er til højre

            fill(alphaHeight+r); //dominerer højdeværdien
          }

          else {
            fill(alphaWidth+r); //bliver domineret af højdeværdien
          }
        }

        else if (j>height/2) { //hvis pixel er under midten
          float alphaHeight = fractionHeight*(height-j);
          int r = int(random(-30, 30));
          if (alphaHeight<alphaWidth) { //hvis pixel er længere oppe end den er til højre
            fill(alphaHeight+r); //dominerer højdeværdien
          }

          else {
            fill(alphaWidth+r); //bliver domineret af højdeværdien
          }
        }

        else {
          int r = int(random(-30, 30));
          fill(alphaWidth+r);
        }
      }

      else {
        fill(255);
      }

      ellipse(i, j, 2, 2);
    }
  }

  //Nu er alle prikker lavet i vores frame.


  //sound
  float amp2 = alpha;
  float amp1 = amp2/500;
  amp = amp1;
  // /sound

  twitch= int(random(1, 20-hourly)); //kast en terning; jo højere aktivitet, jo færre sider på terningen, dvs større sandsynlighed for at 'twitche'

  if (twitch==1) { //hvis random rammer 1, hvilket er mere sandsynligt hvis 'hourly' er en høj værdi. På den måde bliver det tilfældigt, men mere ofte jo mere aktivitet.
    alpha=alpha+int(random(0, hourly*20)); //vi forhøjer alpha'en med en værdi der har chance for at blive stor, afhængig af 'hourly'.
  } //dette er vores generative element, ud fra den timelige data.
}

void mousePressed() {
  if (alpha<255) {
    alpha=alpha+75;
  }
}

class Data {

  String ckanurl;
  float parameter;
  
  Data (String c) {
    ckanurl = c;
    
    Table table = loadTable(ckanurl);
    parameter = float(table.getString(2,4));
    
  }
  
  float getParameter () {
    
   return parameter;
   
  }
}
class NoiseInstrument implements Instrument

{
  // create all variables that must be used throughout the class
  Noise myNoise;
  
  // constructors for the intsrument
  NoiseInstrument( float amplitude, Noise.Tint noiseTint )
  {
    // create new instances of any UGen objects as necessary
    // white noise is used for this instrument
    myNoise = new Noise( amplitude, noiseTint );
  }
  
  // every instrument must have a noteOn( float ) method
  void noteOn( float dur )
  {
    myNoise.patch( out );
  }
  
  // every instrument must have a noteOff() method
  void noteOff()
  {
    // unpatch the output 
    // this causes the entire instrument to stop calculating sampleframes
    // which is good when the instrument is no longer generating sound.
    myNoise.unpatch( out );
  }
}




