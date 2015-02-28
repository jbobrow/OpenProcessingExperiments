
//  Xikawa on Processing Sept 2010  by exprexxo  v1.9
//  Event Analysis
//----------------------------------------------------------------------------------------------------------------------------------
int iFrame=0, fFrames=2;
XMLElement xml;
SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy hh:mm");
Date startdate,lastdate,thisdate;                                                                  //java dates          
long[] starttimes= new long[88];
long[] endtimes=   new long[88];
long basedate,enddate,timespan;                                                                    // defines the graph window in millisecs
long orgenddate,orgbasedate,orginalspan;                                                           //record of the wime frame at program start
long oldbasedate,oldtimespan,newtimespan,incspan,totalduration,totalrun,frames;
long neweventstart,neweventend, newduration;                                                       // used in displaying/entering a new event
float lastMED,nextMED,maxMED,MEDscale,nextMTBE,lastMTBE,maxMTBE,MTBEscale=10,nextPU,lastPU,xscale; //all are ratios or percents
boolean rightzoom=false,rightzooming=false,leftzoom=false,leftzooming=false,demo=true,adding=false,starting=false,ending=false;
String[] cat0s=    new String[88];                                      
String endstr,now,title,newxml,filename="http://exprexxo.net/xikawa/events.xml";                  // Internet test file
String input = ""; 
int events,numEvents,lastEX,lastSX,lastY,newSX,newEX,endx,endy,startX,startY,Xwide,textoff=14;    //integers counts or pixels
PImage logo,mouse;
color shade = color(0, 35, 0);              //    back drop shade color used for fill effect AND to test for a good zoom place.  bust be unique from any other color value on the screen to work 
int sizeX=900, sizeY=700, xmin=18, ymin=32, xmax=sizeX-125, ymax=sizeY-30;     // screen and graphing window size
int brandlinkX=sizeX-28; int brandlinkY=sizeY-46;

void setup() {                    //items to setup  once ever                   
  size(900, 700 );               //redundant value of sizeXand sizeY because Java applet processor needs it to be not a variable and first line in setup.

}


void draw(){    
if (iFrame>fFrames){
   if (abs(newtimespan-timespan) > abs(incspan)){         //  animate the zoom and stop when close 
      timespan=timespan+incspan;    
      if(rightzooming) enddate=timespan+basedate;
      if(leftzooming) basedate=enddate-timespan;
      drawGraph();
   }   
   else {
     rightzooming=false;
     leftzooming=false;
     newtimespan=timespan;
   }     
   if(adding){drawGraph();fill(0);stroke(shade);
     startX=mouseX;Xwide=startY-ymin;startY=mouseY;
     if (startX+Xwide>xmax) Xwide=xmax-startX;    // keep the new event from writing off the right edge
     if (startX<newEX+1)  startX= newEX+1;    // keep the new event from writing before the last event
     rect(startX,ymin,Xwide,ymax-ymin);fill(255);
     neweventstart=basedate+timespan*(startX-xmin)/(xmax-xmin);
     neweventend=basedate+timespan*(startX+Xwide-xmin)/(xmax-xmin);
     newduration =  neweventend -  neweventstart;
     
     text("Starting:"+sdf.format(neweventstart), startX+5, ymin+13);
     text(int(newduration/3600000)+"mins", startX+Xwide/3, ymin+35);
     text("Ending:"+ sdf.format(neweventend), startX+Xwide-140, ymin+55);
     if(starting){
       
     }
     if(ending){
     
     } 
   }
} 
else {
     iFrame++;  
     if (iFrame==1){
        background(0);
        frameRate(1);
        printTitle("                                       Welcome to Xikawa ");
         }
     if (iFrame==2){
        frameRate(30);
        text("Reading ",50,50);
        loadEvents();
        text("Completed Reading ",70,70);        
     }
   }
}

void drawGraph(){
  
// draw the stage
  background(0);
  xscale=float(xmax)/timespan;

  stroke(0,0,75);
  strokeWeight(4);  

//  place  titles
  fill(190, 190, 190);textSize(32);text("Xikawa of "+title, 50, ymin-7);  //Title
  textSize(12);
  stroke(30, 30, 30);
  fill(175, 175, 175);
  pushMatrix(); 
    rotate(HALF_PI); translate(0,-xmax-3); text("As of "+ new Date(enddate), ymax-200, 0); //Right TimeText
    rotate(PI); translate(-1300,10-xmax);  text("Beginning at "+ new Date(basedate), ymax-40, 0);  //Left TimeText
  popMatrix();
  
  textSize(12); text("Xikawa on Processing V1.0", 1248, sizeY-8);                               //  Branding
  logo = loadImage("eicon.png");  image(logo,brandlinkX,brandlinkY);
  
  //Start Drawing the data
  lastEX=xmin;lastSX=xmin;lastY=ymin;lastMED=0;lastMTBE=0;totalduration=0;lastPU=1;events=0;nextMED=0;  //initiate all drawing variables 
  for (int i = 0; i < numEvents; i++) {
     newSX=int(xmin + xscale*(starttimes[i]-basedate));  
     if (xmin<newSX&&newSX<xmax){                                   //check if the event is in the current window
       newEX=int(xmin + xscale*(  endtimes[i]-basedate));    
       //draw event stepfunction   
       strokeWeight(1);      
       fill(shade);   stroke(0,0,0);
       rect(lastEX+1, ymin, newSX-lastEX , ymax-ymin);
       stroke(0,125,0);


       line(lastEX, ymin,newSX, ymin);
       line(newSX, ymin,newSX , ymax);
       line(newSX, ymax,newEX , ymax);
       line(newEX, ymax, newEX , ymin);
       
       //draw MED mean event duration 
       stroke(250,00,0);     strokeWeight(3);    
       line(lastEX, ymax-MEDscale*lastMED,newSX,  ymax-MEDscale*lastMED);
       nextMED=(i*lastMED+endtimes[i]-starttimes[i])/(i+1);
       line(newSX,  ymax-MEDscale*lastMED, newEX , ymax-MEDscale*nextMED);
       
       //draw MTBE mean time between event  
       stroke(0,0,200);
       totalrun=starttimes[i]-basedate;
       nextMTBE=totalrun/(i+1);
       line(lastEX, ymax-MTBEscale*lastMTBE,newSX,  ymax-MTBEscale*nextMTBE);
       lastMTBE=nextMTBE;
       totalrun=endtimes[i]-basedate;
       nextMTBE=totalrun/(i+2);
       line(newSX, ymax-MTBEscale*lastMTBE,newEX,  ymax-MTBEscale*nextMTBE);
   
       //draw %U= percent Uneventful  i.e. availability 
       stroke(00,200,00);
       totalrun=starttimes[i]-basedate;
       nextPU=totalrun-totalduration;nextPU=nextPU/totalrun;                   //split into two steps to stop "long" dividion from going to 0
       line(lastEX, ymax*(1-lastPU)+ymin,newSX,  ymax*(1-nextPU)+ymin);
       totalrun=endtimes[i]-basedate;
       totalduration=totalduration+endtimes[i]-starttimes[i];
       lastPU=nextPU;
       nextPU=totalrun-totalduration;  nextPU=nextPU/totalrun;    //split into two steps to stop "long" dividion from going to 0
      
       line(newSX,ymax*(1-lastPU)+ymin,newEX,   ymax*(1-nextPU)+ymin);
       //increment the references
       lastPU=nextPU; 
       lastSX=newSX;
       lastEX=newEX;lastY=ymin;
       lastMED=nextMED;
       lastMTBE=nextMTBE;
       events++;
     }
  }
  //draw last event section
       fill(shade);   stroke(0,0,0);
       rect(lastEX, ymin, xmax-lastEX , ymax-ymin);
       stroke(0,125,0);strokeWeight(1);
       line(lastEX, ymax, lastEX , ymin);
       line(lastEX, ymin, xmax, ymin);

       //draw last  MED section 
       stroke(250,00,0);     strokeWeight(3);    
       line(lastEX, ymax-MEDscale*lastMED,xmax,  ymax-MEDscale*lastMED);
       textSize(18);  fill(255, 0, 0);  
       text(formatRatio(nextMED)+" days",xmax+textoff,  ymax-MEDscale*lastMED );
       line(625, ymax+15, 648, ymax+15 );
       text("Mean Event Duration : MED",600,  ymax+20);
              
       //draw last MTBE section
       nextMTBE=timespan/numEvents;
       stroke(0,0,200);
       line(lastEX, ymax-MTBEscale*lastMTBE,xmax,  ymax-MTBEscale*nextMTBE);
       textSize(18);  fill(0, 0, 255);  
       text(formatRatio(nextMTBE)+" days",xmax+textoff,  ymax-MTBEscale*nextMTBE );
       line(225, ymax+15,248, ymax+15 );
       text("Mean Time Between Events:  MTBE",250,  ymax+20 );
       
       //draw last %uneventful section
       stroke(00,200,00);
       totalrun=timespan;
       nextPU=totalrun-totalduration;nextPU=nextPU/totalrun;  //split into two steps to stop "long" dividion from going to 0
       line(lastEX, ymax*(1-lastPU)+ymin,xmax,  ymax*(1-nextPU)+ymin);
       textSize(18);  fill(0, 255, 0);  
       text(str(float(int(10000*nextPU))/100)+"%",xmax+textoff,  ymax*(1-nextPU)+ymin );
       line(25, ymax+15,48, ymax+15 );
       text("Percent Uneventful ",50,  ymax+20 );
       
       if(rightzoom){
         fill(0, 255, 0); stroke(00,255,00);
         triangle(xmax+2,(sizeY/2)-(sizeY/16),xmax+12,sizeY/2,xmax+2,(sizeY/2)+(sizeY/16) );
       }
       if(leftzoom){
         fill(0, 255, 0); stroke(00,255,00);
         triangle(xmin-4,(sizeY/2)-(sizeY/16),xmin-14,sizeY/2,xmin-4,(sizeY/2)+(sizeY/16));
       }
        textSize(12); fill(200,200,200); 
        text(events+" events over "+(timespan/(24*3600*1000))+" days",xmax-130,ymin-2); 

}


void loadEvents(){   
  input="";
  try {xml = new XMLElement(this, filename);}                                                            //try to open fileame
  catch (Exception e){ try {
                       text("adding .xml to file in case it was left off",20,20);                                   
                       filename=filename+".xml";
                       xml = new XMLElement(this, filename);}                                           //check for .xml missing if file name
                       catch (Exception f){ filename = "events.xml";
                                            text("trying: "+filename,30,30);
                                            xml = new XMLElement(this, filename); }    }       //if errors reading read default file that comes in data dir   
  //println("Text of "+filename);  println(xml); 
  byte b[] = loadBytes("/data/events.xml");          //byte version of xml file used for adding elements, will go away when xml insert is added                                         
  rightzoom=false;leftzoom=false;
  numEvents = xml.getChildCount();
  startdate= new Date(xml.getStringAttribute("base"));  //add try protextion 
  basedate=startdate.getTime();orgbasedate=basedate;
  endstr=xml.getStringAttribute("end"); 
  try {  lastdate= new Date(endstr); } 
  catch (Exception e){lastdate= new Date();}

  enddate=lastdate.getTime();orgenddate=enddate;
  
  title= xml.getStringAttribute("title"); 
                       
  maxMTBE=0;
  for (int i = 0; i < numEvents; i++) {
    XMLElement kid = xml.getChild(i);
    thisdate= new Date(kid.getStringAttribute("starttime")); 
    starttimes[i]=thisdate.getTime();
    thisdate= new Date(kid.getStringAttribute("endtime"));
    endtimes[i]=thisdate.getTime();
    cat0s[i]= kid.getStringAttribute("cat0"); 
    totalduration=endtimes[i]-starttimes[i];
    nextMED=totalduration/(i+1);
    if (nextMED>maxMED) maxMED=nextMED;     
    totalrun=starttimes[i]-basedate;
    nextMTBE=totalrun/(i+1);                                            //Calculate the Maximum MTBE to scale the MTBE line
    if (nextMTBE>maxMTBE) maxMTBE=nextMTBE;                             //Later a control will be added to the right endpoint to adject MTBEscale visually
  }
  timespan=enddate-basedate;                                            //println(timespan);
  orginalspan=timespan;newtimespan=timespan; incspan=10000;             //set so no extra draws happen
  nextMTBE=timespan/numEvents;                                          //see if long uneventful tail changes maxMTBE
  if (nextMTBE>maxMTBE) maxMTBE=nextMTBE; 
  MEDscale=.2*sizeY/maxMED;
  MTBEscale=.8*sizeY/maxMTBE;                                          //Adjust MTBEscale to not use the top 20% of the stage 
         //start with an opening annimation
  timespan=timespan/30;
  incspan=timespan;
  enddate=basedate+timespan; 
  rightzooming=true;  
  drawGraph();
}


String formatRatio(float F){                               //takes a passed floar ratio  MTBWE or MED and formats to a string ending in 'days' used on right side of graph window
    F=F/3600000;
    F=F/24;
    String S=str(float(round(100*F))/100);
    return(S);
}

void mouseReleased() {
    char onechar;
    endx=mouseX; 
    endy=mouseY;
    long Lx=endx-xmin; long Lxmax = xmax-xmin;long Lxmin = xmin;
    if(endx>brandlinkX&&endy>brandlinkY) link("http://exprexxo.net/wiki/index.php?title=Xikawa"); 
    if(endx>xmin&&endx<xmax&&endy>ymin&&endy<ymax&&get(endx,endy)==shade){     //if the clicked pixel is in the graph window and between events,as detected by color then resize
             oldtimespan=timespan;
             oldbasedate=basedate;
 //            oldenddate=enddate;
        if (mouseButton == LEFT) {
             newtimespan=timespan*(Lxmax-Lx)/Lxmax;
             frames=100-100*(Lxmax-Lx)/Lxmax;
             incspan=(newtimespan-oldtimespan)/frames;
             leftzoom=true;
             leftzooming=true;
      } else if (mouseButton == RIGHT) {
             newtimespan=timespan*Lx/Lxmax;
             frames=100-100*Lx/Lxmax;
             incspan=(newtimespan-oldtimespan)/frames;
             rightzoom=true;
             rightzooming=true;
     } else {
            if (!adding)addevent();
            else {
              adding=false;
              starttimes[numEvents]=neweventstart;
              endtimes[numEvents]=neweventend;
              numEvents++;
              String newevent = "   <event starttime=\""+sdf.format(neweventstart)+"\" endtime=\""+sdf.format(neweventend)+"\" cat=\"unk\"> 23 </event>";
              byte b[] = loadBytes(filename);  
              int oldbyte=b.length; int endtaglen=14;
              int endeventlen=newevent.length();
              b=expand(b,oldbyte+endeventlen+2);int newbyte=b.length;
              for (int ii=1;ii<endtaglen;ii++){b[(b.length-ii)]=b[(oldbyte-ii)];}       //move the end tag
              for (int ii=oldbyte;ii<oldbyte+endeventlen;ii++){onechar=newevent.charAt(ii-oldbyte);b[ii-endtaglen+3]=byte(onechar);}  // write the new tag after the crlf
              filename=filename.substring(0,(filename.length()-4))+"new.xml";println(filename);
              saveBytes(filename,b);
              loadEvents();
            }
     }
     
    }
    if(endx>xmax&&get(endx,endy)==color(0,255,0)){      // the right bright Green arrow was clicked
       rightzoom();
    }
   if(endx<xmin&&get(endx,endy)==color(0,255,0)){ 
       oldtimespan=timespan;
       basedate=orgbasedate;
       newtimespan=enddate-basedate;
       frames=100-100*(newtimespan-oldtimespan)/orginalspan;
       incspan=(newtimespan-oldtimespan)/frames;
       leftzoom=false;leftzooming=true;
    }
}

void rightzoom(){
       oldtimespan=timespan;
       enddate=orgenddate;
       newtimespan=enddate-basedate;
       frames=100*(newtimespan-oldtimespan)/orginalspan;
       incspan=(newtimespan-oldtimespan)/frames;
       rightzoom=false;rightzooming=true;  
}


void keyPressed(){
  if( ((key>='A')&&(key<='Z')) || ((key>='a')&&(key<='z')) || ((key>='.')&&(key<=':')) ){
   input+= key;
   printTitle("Xikawa of "+input);
  }
  if( (key==ENTER) || (key==RETURN) ) {
    println( "The user has entered  '" + input + "'" );
    filename=input;
    loadEvents();  
   }
   if (key==BACKSPACE && input.length() > 0){
     input=input.substring(0,input.length()-1 );
     printTitle("Xikawa of "+input);
   }
}

void printTitle(String titleText){
   stroke(255);fill(0);strokeWeight(1);rect(195,0,700,ymin-4);
   fill(190, 190, 190);
   textSize(32); 
   text(titleText, 50, ymin-7);
}

void addevent(){
    adding=true;
}



