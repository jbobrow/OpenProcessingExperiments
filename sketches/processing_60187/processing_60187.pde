


import java.util.List;  
import java.util.ArrayList;  


import processing.video.*;
int numPixels;
int[] backgroundPixels;

//ArrayList<String> input = new ArrayList();
String[] tweets=new String[1000];
String [] input = new String[1000];
String [] outputOne= new String[1000];
String [] outputTwo= new String[1000];
String [] outputThree = new String[1000];
String [] outputFour= new String[1000];
String [] outputFive= new String[1000];

int oneCount=0;
int twoCount=0;
int threeCount=0;
int fourCount=0;
int fiveCount=0;

int countA=0;
int countB=0;
int countC=0;
int countD=0;
int countE=0;

/*boolean oneWait=false;
boolean twoWait=false;
boolean threeWait=false;
boolean fourWait=false;
boolean fiveWait=false;
*/ 




boolean oneNull=false;
boolean twoNull=false;
boolean threeNull=false;
boolean fourNull=false;
boolean fiveNull=false;





  String Topic = "sound";

PFont fontA;

import controlP5.*;

ControlP5 cp5;


 
 
import ddf.minim.*;
Minim minim;
AudioInput in;
int i = 0;



boolean newTopic=false;





 
 
 
Capture video;
int newx=0;
int newy=0;
int videoWidth=320;
int videoHeight=240;

int savedTime;
int totalTime=8000;

boolean colorCounter=false;
int frameCounter=0;
int frameCounterTotal= 0;

boolean colorAnalysis1=false;
boolean colorAnalysis2=false;
boolean colorAnalysis3=false;
boolean colorAnalysis4=false;
boolean colorAnalysis5=false;






 
 
 
 
void setup() {

  
 

  
    PFont font = createFont("arial",12);
  
  cp5 = new ControlP5(this);
  
  
                  
  
   cp5.addTextfield("Enter a word!")
     .setPosition(300,700)
     .setSize(200,40)
     .setFont(createFont("arial",20))
     .setAutoClear(true)
     ;
     
  
       
     
  textFont(font);
  
  
	
	PFont myFont = createFont("HelveticaRoundedLT-Bold", 32);
	textAlign(CENTER);
	
  	textFont(myFont);
	
	


 
  size(800, 800, P2D);
   background(0);
  video = new Capture(this, videoWidth, videoHeight, 15);
  
  savedTime=millis();
   
 
  loadPixels();
  
    
  
 
  smooth();
  video.crop(0, 0, videoHeight,videoHeight);
   
  minim = new Minim(this);
  minim.debugOn();
    
  // get a line in from Minim, default bit depth is 16
  in = minim.getLineIn(Minim.STEREO, 64);
 
 
  
}




 
 
 
void draw() {
  


 
 
    int loc=newx + newy * video.width;
    color c=video.pixels[loc];
     
  //variability in color of video effects frame rate
  video.loadPixels(); 
  
 int sum = 0;
 int sumAvg = 0;
 for(int ii=0; ii<video.pixels.length;ii++){
   sum += brightness(video.pixels[ii]);
   sumAvg= sum/(videoHeight*videoHeight);
 }
 //println(sumAvg);
   
 
  
 
   
for(int i = 0; i < in.bufferSize() - 1; i++){
   
    if((in.left.get(i)*1000)<=-5 ){
    background(c);
    colorCounter=true;
}
  else if((in.left.get(i)*1000)> -5 && (in.left.get(i)*1000)<3){
  background(0);
  colorCounter=false;
}
  
   else {
   background(c);
   colorCounter=true;
 }
 
 
 
 
 
 if(colorCounter==true){
     frameCounter++;
     frameCounterTotal=frameCounter/in.bufferSize();
    
  
 }
  
     //  println("sound="+(in.left.get(i)*1000)+",frameCounterTotal="+frameCounterTotal);
 
 
     
   // println(in.left.get(i)*1000);
   
  
     
}
   
  if(newx < video.width){
    newx++;
  }
    if(newx == video.width){
    newx=0;
    newy=newy+10;
  }
   if(newy == video.height){
    newx=0;
    newy=0;
  }
   
   
 
  video.read();
  pushMatrix();
  scale(-1,1);
  image(video, -videoHeight, 0);
  popMatrix();
  
 
  
  int passedTime = millis() - savedTime;
  if(passedTime>totalTime){
   

        
      if(frameCounterTotal<10){
      colorAnalysis1=true;
      colorAnalysis2=false;
      colorAnalysis3=false;
     colorAnalysis4=false;
     colorAnalysis5=false;
     println(frameCounterTotal);
     println("sound1");

     

      
    }
    
    
      else if (frameCounterTotal>=10  && frameCounterTotal<50){
      colorAnalysis2=true;
        colorAnalysis1=false;
      
      colorAnalysis3=false;
     colorAnalysis4=false;
     colorAnalysis5=false;
          println("sound2");
          println(frameCounterTotal);
      
      
    }
    
        else if(frameCounterTotal>=50  && frameCounterTotal<75){
        colorAnalysis3=true;
         colorAnalysis1=false;
      colorAnalysis2=false;
      
     colorAnalysis4=false;
     colorAnalysis5=false;
          println("sound3");
          println(frameCounterTotal);
   
    }
    
        else if(frameCounterTotal>=75  && frameCounterTotal<100){
        colorAnalysis4=true;
              colorAnalysis1=false;
      colorAnalysis2=false;
      colorAnalysis3=false;
  
     colorAnalysis5=false;
          println("sound4");
          println(frameCounterTotal);
       
    }
    
      else if(frameCounterTotal>=100){
      colorAnalysis5=true;
            colorAnalysis1=false;
      colorAnalysis2=false;
      colorAnalysis3=false;
     colorAnalysis4=false;
          println("sound5");
          println(frameCounterTotal);
     

    }
      frameCounterTotal=0;
          frameCounter=0;
    
   
     savedTime = millis();
//println("7 seconds have passesed,frameCounterTotal="+frameCounterTotal);


  
      
  }
  
  
  if(newTopic==true){
    
oneCount=0;
twoCount=0;
 threeCount=0;
fourCount=0;
fiveCount=0;

countA=0;
 countB=0;
countC=0;
 countD=0;
 countE=0;
 
 oneNull=false;
 twoNull=false;
 threeNull=false;
fourNull=false;
 fiveNull=false;

    
    
  ConfigurationBuilder cb = new ConfigurationBuilder();
  cb.setOAuthConsumerKey("lPFSpjBppo5u4KI5xEXaQ");
  cb.setOAuthConsumerSecret("SYt3e4xxSHUL1gPfM9bxQIq6Jf34Hln9T1q9KGCPs");
  cb.setOAuthAccessToken("17049577-Yyo3AEVsqZZopPTr055TFdySop228pKKAZGbJDtnV");
  cb.setOAuthAccessTokenSecret("6ZjJBebElMBiOOeyVeh8GFLsROtXXtKktXALxAT0I");
  //Make the twitter object and prepare the query
  Twitter twitter = new TwitterFactory(cb.build()).getInstance();
  Query query = new Query(Topic);
  query.setRpp(100);
  
   //Try making the query request.
  try {
    QueryResult result = twitter.search(query);
    
    //THIS IS WHERE I NEED HELP WITH THE ARRAY
    ArrayList tweets = (ArrayList) result.getTweets();
    
 
    for (int i = 0; i < tweets.size(); i++) {
      Tweet t = (Tweet) tweets.get(i);
      String msg = t.getText();
      int len= msg.length();
      
      
      
      //println(len);
      if(len <15){
        outputOne[oneCount]=msg;
        // println("Group 1 message:"+outputOne[oneCount]); 
        oneCount++;
        oneNull=true;
      }
        else if(len >=15 && len<40){
        outputTwo[twoCount]=msg;
         //   println("Group 2 message:"+outputTwo[twoCount]); 
        twoCount++;
        twoNull=true;
      }
         else if(len >=40 && len<80){
        outputThree[threeCount]=msg;
       //  println("Group 3 message:"+outputThree[threeCount]);
        threeCount++;
        threeNull=true;
      }
      
         else if(len >=80 && len<110){
        outputFour[fourCount]=msg;
    //     println("Group 4 message:"+outputFour[fourCount]) ;
        fourCount++;
        fourNull=true;
      }
      
         else {
        outputFive[fiveCount]=msg;
       // println("Group 5 message:"+outputFive[fiveCount]); 
        fiveCount++;
        fiveNull=true;
      }

      
    };
    
    
  }
  
  
  catch (TwitterException te) {
    println("Couldn't connect: " + te);
  };
  
  newTopic=false;

  }
  
  

   
            
      if(colorAnalysis1==true){
        
        if(oneNull==true){
        
        
          fill(255);
          smooth();
           text(outputOne[countA], 100, height/2,600,300);
         //  countA++;
          // oneWait=true;
        //  println("group1");
        }
        
        else {}
      }

    
      else if (colorAnalysis2==true ){
      
      if (twoNull==true){
        
        
           fill(255);
          smooth();
           text(outputTwo[countB], 100, height/2,600,300);
         // countB++;
       //  twoWait=true;
       //  println("group2");
        }
        
        else{ }
      }

      

    
        else if(colorAnalysis3==true  ){
          
          if(threeNull==true){
         
      
          fill(255);
          smooth();
           text(outputThree[countC], 100, height/2,600,300);
          // countC++;
         // threeWait=true;
          // println("group3");
        }
        
        else{ }
        }

    
        else if(colorAnalysis4==true){
          if(fourNull==true ){
       
              
          fill(255);
          smooth();
           text(outputFour[countD], 100, height/2,600,300);
         //  countD++;
         //fourWait=true;
         //  println("group4");
        }
        
        else{ }
        }

    
      else {
      //if (colorAnalysis5==true){
        if(fiveNull==true ){
      
          
           
          fill(255);
          smooth();
           text(outputFive[countE], 100, height/2,600,300);
        //  countE++;
    // fiveWait=true;
   //   println("group5");
        }
        
        else{ }
      }



     
 
 
  strokeWeight(5);
  stroke(255);
  point(newx,newy);
  

   
 
updatePixels();
   
   

}



void controlEvent(ControlEvent theEvent) {
  if(theEvent.isAssignableFrom(Textfield.class)) {
    println("controlEvent: accessing a string from controller '"
            +theEvent.getName()+"': "
            +theEvent.getStringValue()
            );
            Topic=theEvent.getStringValue();
            newTopic=true;
            
  }
}


public void input(String theText) {
  // automatically receives results from controller input
  println("a textfield event for controller 'input' : "+theText);
}


   

