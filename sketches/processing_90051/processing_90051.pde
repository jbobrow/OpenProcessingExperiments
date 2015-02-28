

/* @pjs preload="logo3.png"; */


XML xml;
XML[] children;
PImage img;
Button[] buttonArray = new Button[8];
Info[] infoArray = new Info[14];

PFont f; 

Button redBtn;
Button orangeBtn;
Button lightGreenBtn;
Button greenBtn;
Button lightBlueBtn;
Button blueBtn;
Button purpleBtn;
Button showAll;


Info qolt;
Info cas;
Info traf;
Info po;
Info sci;
Info gmcrl;
Info cscir;
Info rerc;
Info ilab;
Info cylab;
Info cedm;
Info caps;
Info rci;
Info istc;


void setup() {
  
  //set up the canvas
  size(1090, 830);
  background(255,255,255);
  
  
  //set the default font
  f = loadFont("UniversCE-Light-14.vlw");
 
 
  
  
  
redBtn = new Button(270,355,260,370,18,18, "College of Fine Arts", color(252,148,130),color(255), color (200)); 
orangeBtn = new Button(270,385,260,400,18,18,"Carnegie Institute of Technology",color(252,196,130),color(255), color (200));
lightGreenBtn = new Button(270,415,260,430,18,18,"Heinz College", color(194,219,135),color(255), color (200));
greenBtn = new Button(270,445,260,460,18,18,"College of Humanities and Social Sciences",color(131,180,158),color(255), color (200));
lightBlueBtn = new Button(270,475,260,490,18,18,"Mellon College of Science",color(144,186,207),color(255), color (200));
blueBtn = new Button(270,505,260,520,18,18,"School of Computer Science",color(60,86,151),color(255), color (200));
purpleBtn = new Button(270,535,260,550,18,18,"Tepper School of Business",color(136,84,181),color(255), color (200));
showAll = new Button(270,565, 260,580, 18,18,"Show All", color (255, 246, 110), color(255), color(200));

buttonArray[0] = redBtn;
buttonArray[1] = orangeBtn;
buttonArray[2] = lightGreenBtn;
buttonArray[3] = greenBtn;
buttonArray[4] = lightBlueBtn;
buttonArray[5] = blueBtn;
buttonArray[6] = purpleBtn;
buttonArray[7] = showAll;


qolt = new Info (340,0,40,620,color(255,0), color(255,0));
cas = new Info (380,0,40,620,color(255,0),color(255,0));
traf = new Info(420,0,40,620,color(255,0),color(255,0));
po = new Info(455,0,45,620,color(255,0),color(255,0));
sci = new Info(500,0,40,620,color(255,0),color(255,0));
gmcrl = new Info(550,0,40,620,color(255,0),color(255,0));
cscir = new Info(590,0,30,620,color(255,0),color(255,0));
rerc = new Info(630,0,30,620,color(255,0),color(255,0));
ilab = new Info(670,0,40,620,color(255,0),color(255,0));
cylab = new Info(710,0,40,620,color(255,0),color(255,0));
cedm = new Info(750,0,40,620,color(255,0),color(255,0));
caps = new Info(790,0,40,620,color(255,0),color(255,0));
rci = new Info(830,0,50,620,color(255,0),color(255,0));
istc = new Info(880,0,40,620,color(255,0),color(255,0));

infoArray [0] = qolt;
infoArray [1] = cas;
infoArray [2] = traf;
infoArray [3] = po;
infoArray [4] = sci;
infoArray [5] = gmcrl;
infoArray [6] = cscir;
infoArray [7] = rerc;
infoArray [8] = ilab;
infoArray [9] = cylab;
infoArray [10] = cedm;
infoArray [11] = caps;
infoArray [12] = rci;
infoArray [13] = istc;




 xml = loadXML("innoLabs.xml");
 children = xml.getChildren("row");

  
  img = loadImage("logo3.png");

}



void draw(){
  background(255,255,255);

  image(img,70,60,200,100); 
  
  fill(85,84,84);
   textFont(f,12);
   textAlign(LEFT);
   
   String intro = "Innovation in Carnegie Mellon University happens in the overlapping areas of the seven schools and the result is dozens of active innovation labs. This interactive chart shows the number of faculty or students from different schools involving in the 14 labs in CMU.";
  text(intro,40,210,260,300); 
   
   
    fill(85,84,84);
   textFont(f,10);
   textAlign(LEFT);
   String s1 = "QoLT";
   text(s1,340,565,40,10); 
   
   
   String s2 = "Center for the Arts in Society";
   text(s2,380,565,40,50); 
   

   String s3 = "Traffic 21";
   text(s3,420,565,40,30); 
   
   
   String s4 = "Project Olympus";
   text(s4,455,565,45,30); 
   
  
   String s5 = "STUDIO for Creative Inquiry";
   text(s5,500,565,40,50); 
   
  
   String s6 = "GMCR Lab";
   text(s6,550,565,40,30);
 
   
   String s7 = "CenSCIR";
   text(s7,590,565,30,30); 
   
 
   String s8 = "RERCAPT";
   text(s8,630,565,30,30);
   
   
   String s9 = "iLab";
   text(s9,670,565,40,30);
   
 
   String s10 = "CyLab";
   text(s10,710,565,40,30);
   
   
   String s11 = "CEDM";
   text(s11,750,565,40,30);
   
   
   String s12 = "CAPS";
   text(s12, 790,565,40,30);
   
   String s13 ="Remaking Cities Institute";
   text(s13, 830,565,50,50);
   
   
   String s14 ="ISTC-CC";
   text(s14,880,565,40,30);
   
   
 
  //the x-y coordinator
  fill(151,151,151);
  stroke(151,151,151);
  rect(320,30,2,520);
  
  fill(151,151,151);
  stroke(151,151,151);
  rect(320,550,590,2);


  //to draw the rectangles;
  int totalEntries = children.length;

  
  float cfaPos = 0;
  float citPos = 0;
  float heinzPos = 0;
  float hssPos = 0;
  float mcsPos = 0;
  float scsPos = 0;
  float tepPos = 0;
  float curY = 0;
  
 
 //for loop of the data
  for (int i = 0; i < children.length; i++) {
    
    //set up a universal height variable
    curY = 0;
    
    if(redBtn.on == true || showAll.on == true){
       
    float CFA = children[i].getInt("CFA");
    int cfaNumbers = children[i].getInt("CFA");
    float cfaHeight = (CFA * 5);
    float cfaWidth = 300 / totalEntries;
    fill(252, 148, 130, 255); 
    stroke (255);
    rect(cfaPos+343, 549 - curY- cfaHeight, cfaWidth, cfaHeight, 0);
    cfaPos = cfaPos + cfaWidth + 20;
    
    if (cfaNumbers == 0){
      fill(255,100);
    }else{
      
    textSize(10);
    fill(255);
    text(cfaNumbers,cfaPos+308, 559 - curY- cfaHeight );
    }
    
    curY += cfaHeight;
    
    
    
    }
    
    
    if(orangeBtn.on == true || showAll.on == true){
    float CIT = children[i].getInt("CIT");
    int citNumbers = children[i].getInt("CIT");
    float citHeight = (CIT * 5);
    float citWidth = 300 / totalEntries;
    fill(252, 196, 130, 255); 
    stroke (255);
    rect(citPos+343, 549-curY-citHeight , citWidth, citHeight, 0);
    citPos= citPos  + citWidth +20;
    
    
    if (citNumbers ==0){
      fill(255,0);
    }else{
    textSize(10);
    fill(255);
    text(citNumbers,citPos+308, 559-curY-citHeight);
    }
    curY += citHeight;
    }
    
    if(lightGreenBtn.on == true || showAll.on == true){
    float Heinz = children[i].getInt("Heinz");
    int heinzNumbers = children[i].getInt("Heinz");
    float heinzHeight = (Heinz * 5);
    float heinzWidth = 300 / totalEntries;
    fill(194, 219, 135, 255); 
    stroke (255);
    rect(heinzPos+343, 549-curY-heinzHeight , heinzWidth, heinzHeight, 0);
    heinzPos= heinzPos  + heinzWidth +20;
    
    if (heinzNumbers ==0){
      fill(255,0);
    }else{
    textSize(10);
    fill(255);
    text(heinzNumbers,heinzPos+308, 559-curY-heinzHeight);
    }
    curY += heinzHeight;
    }
    
    if(greenBtn.on == true || showAll.on == true){
    float HSS = children[i].getInt("HSS");
    int hssNumbers = children[i].getInt("HSS");
    float hssHeight = (HSS * 5);
    float hssWidth = 300 / totalEntries;
    fill(131, 180, 158, 255); 
    stroke (255);
    rect(hssPos+343, 549-curY-hssHeight , hssWidth, hssHeight, 0);
    hssPos= hssPos  + hssWidth +20;
    
    if (hssNumbers ==0){
      fill(255,0);
    }else{
    textSize(10);
    fill(255);
    text(hssNumbers,hssPos+308, 559-curY-hssHeight);
    }
    curY += hssHeight;
    }
    
    
    if(lightBlueBtn.on ==true || showAll.on == true){
    float MCS = children[i].getInt("MCS");
    int mcsNumbers = children[i].getInt("MCS");
    float mcsHeight = (MCS * 5);
    float mcsWidth = 300 / totalEntries;
    fill(144, 186, 207, 255); 
    stroke (255);
    rect(mcsPos+343, 549-curY-mcsHeight , mcsWidth, mcsHeight, 0);
    mcsPos= mcsPos  + mcsWidth +20;
    
    if (mcsNumbers ==0){
      fill(255,0);
    }else{
    textSize(10);
    fill(255);
    text(mcsNumbers,mcsPos+308, 559-curY-mcsHeight);
    }
   curY += mcsHeight;
    }
    
    
    if (blueBtn.on ==true || showAll.on == true){
    float SCS = children[i].getInt("SCS");
    int scsNumbers = children[i].getInt("SCS");
    float scsHeight = (SCS * 5);
    float scsWidth = 300 / totalEntries;
    fill(60, 86, 151, 255); 
    stroke (255);
    rect(scsPos+343, 549-curY-scsHeight , scsWidth, scsHeight, 0);
    scsPos= scsPos  + scsWidth +20;
   

 if (scsNumbers ==0){
      fill(255,0);
    }else{
    textSize(10);
    fill(255);
    text(scsNumbers,scsPos+308, 559-curY-scsHeight);
    }
     curY += scsHeight;
    }
    
    
    if(purpleBtn.on == true || showAll.on == true){
   float Tepper = children[i].getInt("Tepper");
   int tepNumbers = children[i].getInt("Tepper");
    float tepHeight = (Tepper * 5);
    float tepWidth = 300 / totalEntries;
    fill(136, 84, 181, 255); 
    stroke (255);
    rect(tepPos+343, 549-curY-tepHeight , tepWidth, tepHeight, 0);
    tepPos= tepPos  + tepWidth +20;
   
   if (tepNumbers ==0){
      fill(255,0);
    }else{
    textSize(10);
    fill(255);
    text(tepNumbers,tepPos+308, 559-curY-tepHeight );
    }
     curY += tepHeight;
  
  }
  
  
}

for (int i=0; i< buttonArray.length;i++){
  buttonArray[i].display();
}


//the introduction of each lab
   fill(85);
   textFont(f,12);
   textAlign(LEFT);
   
   if (qolt.onInfo ==true){
 String ss01 ="The Quality of Life Technology Center(OoLT) is a National Science Foundation (NSF) Engineering Research Center (ERC) focused on the development of intelligent systems that enable older adults and people with disabilities to live more independently. ";
 text(ss01,340,650, 200,140); 
 stroke(243);
   }
   
   if(cas.onInfo == true){
 String ss02 ="The Center for the Arts in Society aims to explore the role of the arts in society--the place and impact of the arts both in the workings of social power and in processes of social change.  ";
 text(ss02,380,650, 200,140); 
 stroke(243);
   }
 
 if(traf.onInfo == true){
 String ss03 ="Traffic21 is a multi-disciplinary research initiative of Carnegie Mellon University. Its goal is to design, test, deploy and evaluate information and communications technology based solutions to address the problems facing the transportation system of the Pittsburgh region. ";
 text(ss03,420,650, 200,140); 
 stroke(243);
 }
 
 if(po.onInfo == true){
 String ss04 ="Project Olympus provides start-up advice, micro-grants, incubator space and connections for faculty and students across campus and with the regional, national and global communities. ";
 text(ss04,460,650, 200,140); 
 stroke(243);
 }
 
 if(sci.onInfo == true){
 String ss05 ="STUDIO for Creative Inquiry is a flexible laboratory for new modes of arts research, production and presentation. Its mission is to support atypical, anti-disciplinary, and inter-institutional research projects at the intersections of arts, sciences, technology and culture.";
 text(ss05,500,650, 200,140); 
 stroke(243);
 }
 
 if(gmcrl.onInfo == true){
 String ss06 ="General Motors Corporation's $3 million collaborative lab (GMCR Lab) at Carnegie Mellon University started its engine in 2000 to speed up research efforts on the next generation of vehicle information technology.  ";
 text(ss06,540,650, 200,200); 
 stroke(243);
 }
 
 if(cscir.onInfo == true){
 String ss07 ="Center for Sensed Critical Infrastructure Research(CenSCIR)  is a research lab working to deliver electronic “nervous systems” to critical infrastructure through the use of sensors systems, processes and technologies. ";
 text(ss07,580,650, 200,140); 
 stroke(243);
 }
 
 if(rerc.onInfo == true){
 String ss08 ="The Rehabilitation Engineering Research Center on Accessible Public Transportation (RERCAPT) will research and develop methods to empower consumers and service providers in the design and evaluation of accessible transportation equipment, information services, and physical environments.  ";
 text(ss08,620,650, 200,200); 
 stroke(243);
 }
 
 if(ilab.onInfo == true){
 String ss09 ="iLab aims at facilitating problem-driven inter-disciplinary research on IT management and policy problems, incubating entrepreneurial culture by encouraging the creation of intellectual property by faculty and students and also serving as channel to create and distribute educational and research products of the school. ";
 text(ss09,660,650, 200,200); 
 stroke(243);
 }
 
 if(cylab.onInfo == true){
 String ss10 ="CyLab is a bold and visionary effort, which establishes public-private partnerships to develop new technologies for measurable, secure, available, trustworthy, and sustainable computing and communications systems. ";
 text(ss10,700,650, 200,140); 
 stroke(243);
 }
 
 if(cedm.onInfo == true){
 String ss11="Center for Climate and Energy Decision Making (CDEM) develops and promulgates new and innovative, behaviorally and technically informed insights involving the intersection points between climate and energy. It will also generate methods to frame, analyze, and assist key stakeholders in addressing important decisions regarding climate change and the necessary transformation of the world's energy system. ";
 text(ss11,740,650, 230,200); 
 stroke(243);
 }
 
 if(caps.onInfo == true){
 String ss12 ="The Center for Atmospheric Particle Studies (CAPS) aims to be world leaders in science, engineering, and policy covering the full role of fine particulate matter in the atmosphere.  ";
 text(ss12,780,650, 200,140); 
 stroke(243);
 }
 
 if(rci.onInfo == true){
 String ss13 ="The Remaking Cities Institute (RCI) is an urban design research center in the School of Architecture.  It conducts international research in place-making, citizen participation planning processes, and sustainable development.";
 text(ss13,820,650, 200,140); 
 stroke(243);
 }
 
 if(istc.onInfo == true){
 String ss14 ="The Intel Science and Technology Center for Cloud Computing (ISTC-CC) is an open community of leading researchers devising critical new underlying technologies for cloud computing of the future. It is headquartered at Carnegie Mellon and includes researchers from Georgia Tech, Intel, Princeton, and UC-Berkeley. ";
 text(ss14,860,650, 200,200); 
 stroke(243);
 }

for (int i=0; i< infoArray.length;i++){
  infoArray[i].display();
}


}

class Button {
    float x;
    float y;
    float lx;
    float ly;
    float w;
    float h;
    String label;
    boolean on;
    boolean press;
    color buttonColor;
    color strokeColor;
    color pressColor; //data of the class
    

    Button(float tempX, float tempY,float tempLabelX, float tempLabelY,  float tempW, float tempH, String labelText, color tempButtonColor, color tempStrokeColor, color tempPressColor){
      x=tempX;
      y=tempY;
      lx = tempLabelX;
      ly = tempLabelY;
      w=tempW;
      h=tempH;
      label = labelText;
      on = false;
      buttonColor = tempButtonColor;
      strokeColor = tempStrokeColor;
      pressColor = tempPressColor;
    }// end constructor of Button
    
    void display(){
      textFont(f,12); 
      textAlign(RIGHT);
      fill(85,84,84);
      text(label,lx, ly);
     
      if(on == true){
        fill(buttonColor);
      }else{
        fill(pressColor);
      }
      stroke(strokeColor);
      rect(x,y,w,h,4);
     
    }
    
    void mouseSet(){
      on = true;
    }
    
     void mouseOff(){
      on = false;
    }
    
    
}

void mouseReleased(){
 for(int i = 0; i<buttonArray.length; i++){
  if(overButton (buttonArray [i].x, buttonArray [i].y, buttonArray [i].w,buttonArray [i].h)){
    if (buttonArray[i].on == true){
     buttonArray[i].mouseOff();
    }else{
     buttonArray[i].mouseSet(); 
    } 
    
  }
 }
}





class Info {
    float ix;
    float iy;
    float iw;
    float ih;
    String labs;
    boolean onInfo;
    color infoColor;
    color iStrokeColor;

    
    Info(float tX, float tY, float tw, float th, color tempInfoColor, color tempIStrokeColor) {
      ix=tX;
      iy=tY;
      iw = tw;
      ih = th;
      onInfo = false;
      infoColor = tempInfoColor;
      iStrokeColor = tempIStrokeColor;
      
    }// end constructor of Info
    
    void display(){
     
      fill(infoColor);
      stroke(iStrokeColor);
      rect(ix, iy,iw,ih);
      
      onInfo = overInfo(ix, iy, iw,ih);
    }
}




boolean overButton(float x, float y, float width, float height){
  if (mouseX>=x && mouseX<=x + width && mouseY>=y && mouseY<=y+height){
    return true;
  }else{
    return false;
  }
}

boolean overInfo(float x, float y, float width, float height){
  if(mouseX>=x && mouseX<=x + width && mouseY>=y && mouseY<=y+height){
    return true;
  }else{
    return false;
  }
}



