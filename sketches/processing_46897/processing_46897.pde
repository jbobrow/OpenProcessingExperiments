
 /**
 Annelie's weather feed
 * using code from Recursive Tree
 * by Daniel Shiffman.  
 * 
 * Renders a simple tree-like structure via recursion. 
 * The branching angle is calculated as a function of 
 * the horizontal mouse location. Move the mouse left
 * and right to change the angle.
 */
 
 
 String myString;
 String windspeedString;
 String windgustString;
 String temprString;
 String temprchillString;
 String winddegreesString;
 
 int windspeedNum;
 int windgustNum;
 int temprNum;
 int temprchillNum;
 int winddegreesNum;
 
 XMLElement xml;
   boolean useProxy = true; //make true when exporting to web, false when running locally
  String proxy = "http://itp.nyu.edu/proxy/proxy.php?url=";
  
 float theta;
 
 //float value = 0.5; //for lerping
 
 //float noiseVal; //for perlin noise
 //float noiseScale=0.02;
 
 void setup()
 {
   size (640, 360, P3D);
   smooth();
   
   String KNYC = "http://www.weather.gov/xml/current_obs/KNYC.xml"; //central park
    
      if (useProxy) {
    KNYC = proxy+KNYC;
  }
    
     xml = new XMLElement(this, KNYC); 
     println(xml);
     
       XMLElement windspeedXML = xml.getChild("wind_mph");
         String windspeedString = windspeedXML.getContent();
            windspeedNum = int(windspeedString);
               println(windspeedNum);
               frameRate(1);
       XMLElement windgustXML = xml.getChild ("wind_gust_mph");
         String windgustString = windgustXML.getContent();
             windgustNum = int (windgustString);
               println (windgustNum);
               frameRate(1);
       XMLElement temprXML = xml.getChild ("temp_f");
         String temprString = temprXML.getContent();
             temprNum = int (temprString);
               println (temprNum);
               frameRate(1);
       XMLElement temprchillXML = xml.getChild ("windchill_f");
         String temprchillString = temprchillXML.getContent();
             temprchillNum = int (temprchillString);
               println (temprchillNum);
               frameRate(1);      
       XMLElement winddegreesXML = xml.getChild ("wind_degrees");
         String winddegreesString = winddegreesXML.getContent();
             winddegreesNum = int (winddegreesString);
               println (winddegreesNum);
               frameRate(1);
 }
 
 void draw()
 {
   background (0);
   frameRate(30);
   stroke (255);
   
   float a = (winddegreesNum / (float)width) * 90f;
   theta = radians (a); // uses the above and sets it to radians
   translate (width/2, height); //lets start in the middle and at the bottom of the screen
     line (0, 0, 0, -120); //now that we're in the middle and at the height, let's draw a line up the middle
     translate (0, -120); //go to the end of the line and then...
     branch (120); //draw another branch
 }
 
 
 void branch (float h) {
   h*=0.66; //deciding that each branch is .66 size of previous (2/3)
   
   //this will be the exit-- checking length of branches 
   if (h>2) {
     pushMatrix();
     rotate (theta);
     line (0,0,0,-h); //drawing branch based on h
     translate (0, -h);
     branch (h);
     popMatrix(); //restore previous matrix state
     
     pushMatrix(); //branching off to the left now
     rotate (-theta); //so we're going to the left
     line (0, 0, 0, -h);
     translate (0, -h);
     branch (h);
     popMatrix();
   }
 }
   

   
   /* 
   //lerping color
      float percent = norm (value, temprNum, temprchillNum);
   color between = lerpColor (#FF4422, #4422CC, percent);
   fill (between);
   ellipse (15, 15, windspeedNum, windgustNum);
   
   perlin noise
     // more perlin noise
   for (int y=0; y<height; y++){
     for (int x = 0; x < width/2; x++) {
       noiseDetail (windspeedNum, 0.5);
       noiseVal = noise(
       (windspeedNum+x) * noiseScale,
       (windspeedNum+y) * noiseScale
       );
       stroke (noiseVal*255);
       point (x, y);
     }
   }
   //perlin noise
   xoff = xoff+0.1;
   float n = noise (xoff)*width;
    ellipse (n, 0, n, height);
    */
   


