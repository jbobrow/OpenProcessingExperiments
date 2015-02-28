
import java.awt.Rectangle;
import de.bezier.data.XlsReader;

int width=1200;
int height=670;

PImage europeMap;
PImage finalEuropeMap;
Country[] europe= new Country[19];
int[] displayCountryColor= new int[19];

PShape europeCountryMap;

PImage yellowGuy;
PImage greenGuy;
PImage yellowBattle;
PImage greenBattle;
PImage yellowgreenBattle;

PImage foodCrateIcon;
PImage foodCrateIcon2;

PFont font;
PFont font2;
PFont font3;
PFont font4;
PFont font5;
PFont font6;
PFont font7;
PFont font8;

//Read Excel sheet
XlsReader excelReader;
Battle[] battles;

//Dice
Weapon[] weaponsDatabase= new Weapon[7];
PImage[] medicineDice=new PImage[6];
PImage[] foodDice=new PImage[6];
PImage[] troopsDice=new PImage[6];

//Array of Bonus Questions
String[] questions=new String[9];
String[] questionsTitle=new String[9];

//Array of Answers
String[] answers=new String[9];

PImage plane;
PImage tank;
PImage zeppelin;
PImage rifle;
PImage torpedo;
PImage poisonGas;
PImage machineGun;

void setup()
{
   size(1200,670); 
   smooth();
   
     plane=loadImage("planeIcon.png");
     tank=loadImage("tankIcon.png");
     zeppelin=loadImage("zeppelinIcon.png");
     rifle=loadImage("rifleIcon.png");
     torpedo=loadImage("torpedoIcon.png");
     poisonGas=loadImage("poisonGasIcon.png");
     machineGun=loadImage("machineGunIcon.png");
   
   europeMap=loadImage("EuropeOrig.png");
   finalEuropeMap=loadImage("Europe.png");
   
   yellowBattle=loadImage("yellowBattle.png");
   greenBattle=loadImage("greenBattle.png");
   yellowgreenBattle=loadImage("yellowgreenBattle.png");
   foodCrateIcon=loadImage("foodIcon1.png");
   foodCrateIcon2=loadImage("foodIcon3.png");
      
   font=loadFont("LaoUI-Bold-16.vlw");
   font2=loadFont("LaoUI-20.vlw");
   font3=loadFont("LaoUI-17.vlw");
   font4=loadFont("LaoUI-32.vlw");
   font5=loadFont("LaoUI-15.vlw");
   font6=loadFont("LaoUI-13.vlw");
   font7=loadFont("FrenchScriptMT-80.vlw");
   font8=loadFont("FrenchScriptMT-200.vlw");
   
    //Create an array of countries
    europe[0]=new Country("tunisia2.png",285,620,"Allied Power","Tunisia");
    europe[1]=new Country("italy2.png",355,472,"Allied Power","Italy");
    europe[2]=new Country("england2.png",182,247,"Allied Power","England");
    europe[3]=new Country("ireland2.png",125,201,"Allied Power","Ireland");
    europe[4]=new Country("portugal2.png",20,467,"Allied Power","Portugal");
    europe[5]=new Country("morocco2.png",8,620,"Allied Power","Morocco");
    europe[6]=new Country("algeria2.png",173,620,"Allied Power","Algeria");
    europe[7]=new Country("russia2.png",581,304,"Allied Power","Russia");
    europe[8]=new Country("serbia2.png",480,458,"Allied Power","Serbia");
    europe[9]=new Country("albania2.png",465,522,"Allied Power","Albania");
    europe[10]=new Country("greece2.png",494,565,"Allied Power","Greece");
    europe[11]=new Country("belgium2.png",257,300,"Allied Power","Belgium");
    europe[12]=new Country("montenegro2.png",420,490,"Allied Power","Montenegro");
    europe[13]=new Country("austria-hungary2.png",414,396,"Central Power","Austria-Hungary");
    europe[14]=new Country("germany2.png",350,299,"Central Power","Germany");
    europe[15]=new Country("bulgaria2.png",540,490,"Central Power","Bulgaria");
    europe[16]=new Country("ottoman-empire2.png",614,554,"Central Power","Ottoman Empire");
    europe[17]=new Country("romania2.png",546,440,"Allied Power","Romania");
    europe[18]=new Country("france2.png",210,385,"Allied Power","France");
   
   //Initialize array to hold -1
   for(int i=0; i<19; i++)
   {
      displayCountryColor[i]=-1; 
   }
   
   yellowGuy=loadImage("yellowGuy.png");
   greenGuy=loadImage("greenGuy.png");
   
   loadExcel();
   
   weaponsDatabase[0]=new Weapon("Torpedo", 5000, "torpedoIcon.png", "torpedo.png");
   weaponsDatabase[1]=new Weapon("Plane",6000, "planeIcon.png", "plane.png");
   weaponsDatabase[2]=new Weapon("Rifle",9000, "rifleIcon.png", "rifle.png");
   weaponsDatabase[3]=new Weapon("Machine Gun", 10000, "machineGunIcon.png", "machineGun.png");
   weaponsDatabase[4]=new Weapon("Poison Gas", 8000, "poisonGasIcon.png", "poisonGas.png");
   weaponsDatabase[5]=new Weapon("Zeppelin", 1000, "zeppelinIcon.png", "zeppelin.png");
   weaponsDatabase[6]=new Weapon("Tank", 7000, "tankIcon.png", "tank.png");
   
   medicineDice[0]=loadImage("medicine0.png");
   medicineDice[1]=loadImage("medicine1.png");
   medicineDice[2]=loadImage("medicine2.png");
   medicineDice[3]=loadImage("medicine3.png");
   medicineDice[4]=loadImage("medicine4.png");
   medicineDice[5]=loadImage("medicine5.png");
   
   foodDice[0]=loadImage("food0.png");
   foodDice[1]=loadImage("food2.png");
   foodDice[2]=loadImage("food4.png");
   foodDice[3]=loadImage("food6.png");
   foodDice[4]=loadImage("food8.png");
   foodDice[5]=loadImage("food10.png");
   
   troopsDice[0]=loadImage("troop0.png");
   troopsDice[1]=loadImage("troop2.png");
   troopsDice[2]=loadImage("troop4.png");
   troopsDice[3]=loadImage("troop6.png");
   troopsDice[4]=loadImage("troop8.png");
   troopsDice[5]=loadImage("troop10.png");
   
   questions[0]="A. A rifle\n\nB. A machine gun\n\nC. A cannon\n\nD. A tank";
   questions[1]="A. Triple Entente\n\nB. Triple Alliance\n\nC. Central Powers\n\nD. Allied Powers";
   questions[2]="A. The civilian attack in France\n\nB. The German invasion of Belgium\n\nC. The assassination of Franz Ferdinand\n\nD. The sinking of Lusitania ";
   questions[3]="A. Southwest Germany\n\nB. Northeast France\n\nC. Northeast Italy\n\nD. Southeast Germany";
   questions[4]="A. The Allied Powers asked for assistance\n\nB. The Central Powers dominance\n\nC. The sinking of the Lusitania\n\nD. The Zimmerman note";
   questions[5]="A. They were not able to carry a lot of weapons\n\nB. They were big and not stealthy\n\nC. They were easy to shoot down\n\nD. They were unsafe to fly on windy days";
   questions[6]="A. Develop different types of weapons\n\nB. Protect soldiers by building fortified trenches\n\nC. Protect Britain from naval attacks in the North Sea\n\nD. Protect Germany from France on the West and Russia from the East";
   questions[7]="A. Because the Ottoman Empire assassinated the king\n\nB. Because Austria-Hungary declared war on England\n\nC. Because the German Empire attacked Lusitania\n\nD. Because the German Empire invaded Belgium";
   questions[8]="A. The final period of the war where the Allied Power were victorious\n\nB. The hundreds days of solitude that the soldiers experienced in 1915\n\nC. The period where the Central Powers were victorious\n\nD. The hundred days of peace after the war ended";
   
   questionsTitle[0]="What weapon had a firing range of 1,400 meters?";// \n\nA. A rifle\n\nB. A machine gun\n\nC. A cannon\n\nD. A tank";
   questionsTitle[1]="Austria-Hungary, Germany, and Italy were part of the..";//   \n\nA. Triple Entente\n\nB. Triple Alliance\n\nC. Central Powers\n\nD. Allied Powers";
   questionsTitle[2]="What event started the war?";//  \n\nA. The civilian attack in Francen\n\nB. The German invasion of Belgiumn\n\nC. The assassination of Franz Ferdinandn\n\nD. TThe sinking of Lusitania ";
   questionsTitle[3]="Where was the Hindenberg Line located?";//  \n\nA. Southwest Germany\n\nB. Northeast France\n\nC. Northeast Italy\n\nD. Southeast Germany";
   questionsTitle[4]="Why did the United States join the war?";//  \n\nA. The Allied Powers asked for assistance\n\nB. The Central Powers dominance\n\nC. The sinking of the Lusitania\n\nD. The Zimmerman note";
   questionsTitle[5]="Why were zeppelins ineffective?";//  \n\nA. They were not able to carry a lot of weapons\n\nB. They were big and not stealthy\n\nC. They were easy to shoot down\n\nD. They were unsafe to fly on windy days";
   questionsTitle[6]="The Schlieffen Plan was to… ";//  \n\nA. Develop different types of weapons\n\nB. Protect soldiers by building fortified trenches\n\nC. Protect Britain from naval attacks in the North Sea\n\nD. Protect Germany from France on the West and Russia from the East";
   questionsTitle[7]="Why did England join the war?";// \n\nA. Because the Ottoman Empire assassinated the king\n\nB. Because Austria-Hungary declared war on England\n\nC. Because the German Empire attacked Lusitania\n\nD. Because the German Empire invaded Belgium";
   questionsTitle[8]="What was the Hundreds Day Offensive?";
   
   answers[0]="a";
   answers[1]="b";
   answers[2]="c";
   answers[3]="b";
   answers[4]="d";
   answers[5]="c";
   answers[6]="d";
   answers[7]="d";
   answers[8]="a";
   
   
}

//Title Screen & Instructions
boolean titleScreen=true;
boolean instructions=false;
boolean instructions2=false;

//Game screen
boolean game=false;//----------------------------------------------------------------------------------

//Assign countries to allies or central power
boolean assignColor=true;//true;changebacktotrueeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
boolean chooseSide=false;
String power="Central Power";
boolean displayError=false;
boolean found=false;

//Yellow and Green button to identify powers
boolean yellowSelected;
boolean greenSelected;
boolean start=true;
int xYellow;
int yYellow;
int xGreen;
int yGreen;
int buttonHeight=75;
int buttonWidth=75;
Rectangle recYellow;
Rectangle recGreen;
String winner;

//Play the game
boolean gamePlay=false;//---------------------------------------------------------------------------------
int counter=0;

int troopCount=3000000;
int foodCount=0;//CHNGE BACK TO ZEROOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO

//Four Dice: Medicine Food Weapons and Troops
//0,1,2,3,4,5
PImage[] diceMedicine;
int medicineCount=-1;
int medSaved=0;
//0,2,4,6,8,10
PImage[] diceFood;
int foodCountDice=-1;
//
Weapon[] weapons=new Weapon[15];
PImage[] weapons2=new PImage[15];
int[] weapons3=new int[15];
int weaponNumber=-1;
//0,2,4,6,8,10
PImage[] diceTroops;
int troopCountDice=-1;

Rectangle recMed;
Rectangle recFood;
Rectangle recWeapon;
Rectangle recTroop;
int yDiceLocation;
int diceHeight;
int diceWidth;

int randomMed;
int randomFood;
int randomWeapon;
int randomTroop;

Rectangle weaponsInfo;
Rectangle joinedInfo;
Rectangle strategiesInfo;

boolean dispWeaponsInfo=false;
boolean weaponsNext=false;
boolean dispJoinedInfo=false;
boolean joinedNext=false;
boolean dispStrategiesInfo=false;
boolean strategiesNext=false;

int timer=0;
int totalCasualties;
int troopsEarned;

boolean battleview=false;
boolean displayCurrentBattle=false;
boolean displayReviewBattle=false;
int reviewNumber=-1;

int randTrivia;
int triviaNumber=-1;
boolean questionTime=false;

boolean isPlaying=false;

//Return to instructions
boolean inGame=false;
Rectangle returnToInstructions;

//Game Over
boolean gameOver=false;
boolean winGame=false;

void draw()
{
  background(255);
  if(titleScreen)
  {
    strokeWeight(3);
    fill(153,206,255);
    rect(0,0,width,height);
    fill(112,255,146);
    rect(10,10,width-20,height-20);
    fill(255,246,109);
    rect(20,20,width-40,height-40);
    
    textAlign(LEFT);
    textFont(font8);
    
    fill(153,206,255);
    text("Once",105,185);
    text("Upon a",315,355);
    text("War...",705,525);
    text("Once",103,183);
    text("Upon a",313,353);
    text("War...",703,523);    
            
    fill(0);
    text("Once",100,180);
    text("Upon a",310,350);
    text("War...",700,520);
    
    fill(0);
    textFont(font2);
    textAlign(CENTER);
    text("Do you have what it takes to survive through the major battles of World War 1? \nA game of chance and knowledge of World War 1.",width/2,590);
    
    text("Click anywhere to continue",7*width/8,40);
  }
  
  else if(instructions)
  {
    //Borders
    strokeWeight(3);
    fill(153,206,255);
    rect(0,0,width,height);
    fill(112,255,146);
    rect(10,10,width-20,height-20);
    fill(255,246,109);
    rect(20,20,width-40,height-40);
    textAlign(CENTER);
    
    //Text

    textFont(font4);
    String welcome="Welcome to Once Upon a War";
    fill(153,206,255);
    text(welcome, 42,52,width-80,width-80);
    fill(0);    
    text(welcome, 40,50,width-80,width-80);
    textFont(font3);
    String instr="As a commander of your army, you will have to lead your troops through the major battles of World War 1. The main objective of the game is to survive the war. Initially you will have 3 million troops and zero crates of food. Every crate of food feeds 400,000 soldiers and can easily run out. If you do not have any soldiers or food, the game will be over. You will have opportunities to earn food crates, troops, and supplies in the game. \n\n In the first stage of the game, you will match up countries to either Allied or Central Powers. If correct, you will be rewarded with 50,000 troops and a crate of food. In the second stage of the game, you will choose a side, the Allied Powers or the Central Powers. Based on your choice, you will suffer the same casualties that they suffered at every battle visited, but you will also obtain supplies by clicking on the dice at every battle.\n\nThere are bonus opportunities to gather more supplies from your allies so make sure you read the sections on the Weapons of World War 1, Why Countries Joined World War 1, and Strategies of World War 1. There are two pages per each section, so click on the information screen to move onto the next page.\n\nIf you would like to learn more about each battle, click on the battle location for a brief summary.\n\nIf instructions are open or are reading the educational sections to return to the game at any time, simply click inside the map area to continue.";   
    text(instr, 40,135, width-80,height-120);
    textFont(font2);
    text("Good luck and have fun!",width/2,625);
    textAlign(LEFT);
    strokeWeight(10);
  }
  
  else if(instructions2)
  {
    //Borders
    strokeWeight(3);
    fill(153,206,255);
    rect(0,0,width,height);
    fill(112,255,146);
    rect(10,10,width-20,height-20);
    fill(255,246,109);
    rect(20,20,width-40,height-40);
   
    //Text
    textFont(font2);
    textAlign(LEFT);  
    fill(153,206,255);
    text("Stage 1:",41,51);    
    text("Stage 2:",41,201);
    text("Hint:",41,631);
    fill(0);
    text("Stage 1:",40,50);    
    text("Stage 2:",40,200);
    text("Hint:",40,630);
    textFont(font5);
    String stage1="          There is a blank map of Europe during World War 1. Your mission is to determine which country belongs to which side: the Allied Powers or the Central Powers. You will drag and a drop a soldier on top of the country name. If you correctly color the country, you will receive 500,000 additional troops as well as a crate of food. (Hint: This is a good opportunity to stock up on food crates. If there are not enough food crates, your soldiers will starve to death.)";
    String stage2="          The map will mark the location of a battle. A screen will appear with information about the battle. You will click on four dice on the bottom right which represents the amount of medicine, food, weapons, and troops you will receive at each battle location.";
    String medicine="Medicine heals soldiers and prevents casualties. Each medicine saves 5,000 lives. Medicine cannot be stored so they will be used immediately.";
    String food= "Food is consumed at each battle. Each crate of food will feed 400,000 soldiers. The number of crates will be displayed on the right.";
    String weapons="Weapons prevent deaths. Weapons will accumulate after every battle and will be displayed on the right.";
    String troops="Troops will give you more soldiers per 10,000. For example, if you roll the die with a 2 you will receive 20,000 more soldiers.";
    text(stage1,40,80,width-80,height-80);
    text(stage2,40,230,width-80,height-80);
    text(troops,120,320);
    text(medicine,120,360);
    text(food,120,400);
    text(weapons,120,440);
    
    text("    Torpedoes save 5,000 lives",200,480);
    image(torpedo,400,455);
    text("    Planes save 6,000 lives",200,510);
    image(plane,370,485);
    text("    Rifles save 9,000 lives",200,540);
    image(rifle,370,515);
    text("    Machine Guns save 10,000 lives",200,570);
    image(machineGun,425,545);
    text("    Poison Gas saves 8,000 lives",698,480);
    image(poisonGas,905,443);
    text("    Zeppelins save 1,000 lives",700,510);
    image(zeppelin,890,485);
    text("    Tanks save 7,000 lives",700,540);
    image(tank,860,515);
    text("Food is an important factor in suvival. Make sure you stock up as much as you can so your soldiers do not starve.",100,630);
  }  
  
  else if(game)
  {    
    displayTitle();
    //Stage 1
    if(assignColor)
    {
      timer+=1;
      displayAssignColorDirections();
      displayReviewInstructions(); 
      displayMap();
      displayCountryNames();
      
      if(displayError)
      {
         textAlign(LEFT);
         textFont(font);
         text("Please drag soldier on top of the country name",820,65); 
      }
      
       if(start)
       {
          xYellow=865;
          yYellow=185; 
          xGreen=1035;
          yGreen=185; 
       }
       if(!mousePressed)
       {
         yellowSelected=false;
         greenSelected=false;
         start=true;
         if(displayError && timer%50==0)
         {
            displayError=false; 
         }
       }
       if(yellowSelected)
       {
          winner="Central Power";
          checkBoundary();
          xYellow=mouseX-buttonWidth/2;
          yYellow=mouseY-buttonHeight/2;
       }
       if(greenSelected)
       {
          winner="Allied Power";
          checkBoundary();
          xGreen=mouseX-buttonWidth/2;
          yGreen=mouseY-buttonHeight/2;
       }
       
       //Clickable box
       recYellow = new Rectangle(xYellow, yYellow, buttonWidth, buttonHeight); 
       recGreen = new Rectangle(xGreen, yGreen, buttonWidth, buttonHeight);
       
       //Making the Box 
          pushMatrix();
          fill(255);
          strokeWeight(3);
          stroke(0);
          rect(1030,180,85,85);
          rect(860,180,85,85);

          //Text
          fill(0);
          textFont(font5);
          text("Allied Powers",1030,285);
          text("Central Powers",855,285);
          popMatrix();
      
       image(yellowGuy,xYellow,yYellow);
       image(greenGuy,xGreen,yGreen);
      
       //Check if finished
       if(displayCountryColor[18]!=-1)
       {
          assignColor=false;
          chooseSide=true; 
       }
    }
       
       //Choose a side
       else if(chooseSide)
       {
          displayMap();
          displayChooseSide();
          displayReviewInstructions(); 
          displayCountryNames();
          
          xYellow=865;
          yYellow=185; 
          xGreen=1035;
          yGreen=185; 
          
         //Clickable box
         recYellow = new Rectangle(xYellow, yYellow, buttonWidth, buttonHeight); 
         recGreen = new Rectangle(xGreen, yGreen, buttonWidth, buttonHeight);
       
         //Making the Box 
          pushMatrix();
          fill(255);
          strokeWeight(3);
          stroke(0);
          rect(1030,180,85,85);
          rect(860,180,85,85);

          //Text
          fill(0);
          textFont(font5);
          text("Allied Powers",1030,285);
          text("Central Powers",855,285);
          popMatrix();
      
         image(yellowGuy,xYellow,yYellow);
         image(greenGuy,xGreen,yGreen);
       }
    
    //Stage 2
    else if(gamePlay)
    {
      timer+=1;
      inGame=true;
      textFont(font);
      displayReviewInstructions(); 
      displayMap();
      displayCountryNames();
      textFont(font3);
      displayWeaponsInfo();
      displayJoinInfo();
      displayStrategiesInfo();
      
     //Pin the current battle
      if(counter!=0)
      {
         stroke(235,85,255,150);
         if(battles[counter]!=null)
         {
           line(battles[counter-1].x,battles[counter-1].y,battles[counter].x,battles[counter].y); 
         }
      }     
      //Pin the visited locations on the map
      for(int i=0; i<counter; i++)
      {
          if(i+1!=counter)
          {
            if(battles[i].victor.equals("Central Power"))
            {
               stroke(255,85,85,150);             
            }
            else
            {
               stroke(255,162,85,150); 
            }
            line (battles[i].x,battles[i].y,battles[i+1].x,battles[i+1].y);
          }
          if(battles[i].victor.equals("Central Power"))
          {
              image(yellowBattle,battles[i].x-15,battles[i].y-15);
          }
          else
          {
              image(greenBattle,battles[i].x-15,battles[i].y-15);
          }
      }
      
      image(yellowgreenBattle,battles[counter].x-15,battles[counter].y-15);
           
      //If no more troops or food, game over
      if(troopCount<=0 || foodCount<=0)
      {
         //Game Over
          game=false;
          gameOver=true;
      }
      
      //Wait some time before displaying battle info
        if(timer>=55)
        {
          displayCurrentBattle=true;
        }
        
        displayWeaponry();
        
        //Create dice
        yDiceLocation=575;
        diceHeight=80;
        diceWidth=80;
        
        //Display the Dice changing
        randomMed=(int)random(0,6);
        randomFood=(int)random(0,6);
        randomWeapon=(int)random(0,7);
        randomTroop=(int)random(0,6);
        
         //Create rectangles to click on     
         recMed= new Rectangle(800, yDiceLocation, diceWidth, diceHeight);
         recFood= new Rectangle(900, yDiceLocation, diceWidth, diceHeight);
         recWeapon= new Rectangle(1000, yDiceLocation, diceWidth, diceHeight);
         recTroop= new Rectangle(1100, yDiceLocation, diceWidth, diceHeight);
         
        //Create rectangle border
        fill(255);
        strokeWeight(3);
        if (medicineCount!=-1)
        {
           stroke(153,206,255);
        }
        else
        {
             stroke(0);
        }
        rect(800,yDiceLocation-5,diceWidth+10,diceHeight+10);
        
        if(foodCountDice!=-1)
        {
            stroke(153,206,255);
        }
        else
        {
            stroke(0);
        }
          rect(900,yDiceLocation-5,diceWidth+10,diceHeight+10);
        
        if(weaponNumber!=-1)
        {
           stroke(153,206,255);
        }
        else
        {   
            stroke(0);
        }
         rect(1000,yDiceLocation-5,diceWidth+10,diceHeight+10);
        
        if(troopCountDice!=-1)
        {
          stroke(153,206,255);
        }
        else
        {
            stroke(0);
        }
        rect(1100,yDiceLocation-5,diceWidth+10,diceHeight+10);
        stroke(0);
        
        //If all finished display the second screen
        if(medicineCount!=-1 && foodCountDice!=-1 && weaponNumber!=-1 && troopCountDice!=-1)
        {
          //Don't forget to reset back to -1, and make sure that if already chosen not to be able to choose again
          //Anad make sure you check for food
            image(medicineDice[medicineCount],805,yDiceLocation);
            image(foodDice[foodCountDice],905,yDiceLocation);
            image(weaponsDatabase[weaponNumber].weaponDice,1005,yDiceLocation);
            image(troopsDice[troopCountDice],1105,yDiceLocation);
            
           displayCurrentBattle=false;
           displayBattleFull(counter); 
           battleview=true;
        }
        
         if(displayReviewBattle)
        {
            displayBattle(reviewNumber);
            timer=0;
        }
        else if(displayCurrentBattle)
        {
            displayBattle(counter);
  
          if (medicineCount!=-1)
          {
             image(medicineDice[medicineCount],805,yDiceLocation);
             medSaved=medicineCount*5000; 
          }
          else
          {
               image(medicineDice[randomMed],805,yDiceLocation);
          }
          
          if(foodCountDice!=-1)
          {
              image(foodDice[foodCountDice],905,yDiceLocation);
          }
          else
          {
              image(foodDice[randomFood],905,yDiceLocation);
          }
          
          if(weaponNumber!=-1)
          {
             
             image(weaponsDatabase[weaponNumber].weaponDice,1005,yDiceLocation);
             weapons2[counter]=weaponsDatabase[weaponNumber].displayIcon;
             weapons3[counter]=weaponsDatabase[weaponNumber].value;
             weapons[counter]=weaponsDatabase[weaponNumber];
             //new Weapon(weaponsDatabase[weaponNumber].name,weaponsDatabase[weaponNumber].value,weaponsDatabase[weaponNumber].iconName,weaponsDatabase[weaponNumber].diceIconName);
//             if(weapons[counter]!=null)
//             {
//                println(weapons[counter].name + weapons[counter].iconName + weapons[counter].diceIconName); 
//             }
          }
          else
          {
              image(weaponsDatabase[randomWeapon].weaponDice,1005,yDiceLocation);      
              stroke(0);
          }
          
          if(troopCountDice!=-1)
          {
            image(troopsDice[troopCountDice],1105,yDiceLocation);
          }
          else
          {
            image(troopsDice[randomTroop],1105,yDiceLocation); 
          }       
        }
          
            //Trivia Questions
            if(counter==1 || counter==4 || counter==7 || counter==10 || counter==13)
            {
                   questionTime=true; 
            }
            
           if(timer>=50)
           {
             if(!displayReviewBattle)
             {
              if(counter==2 && questionTime==true)
              {
                if(triviaNumber==-1)
                {
                  randTrivia=(int)random(0,2);
                  triviaNumber=randTrivia;
                }
              }
              if(counter==5 && questionTime==true)
              {
                if(triviaNumber==-1)
                {
                  randTrivia=(int)random(2,4);
                  triviaNumber=randTrivia;
                }
              }
              if(counter==8 && questionTime==true)
              {
                if(triviaNumber==-1)
                {
                  randTrivia=(int)random(4,6);
                  triviaNumber=randTrivia;
                }
              }
              if(counter==11 && questionTime==true)
              {
                if(triviaNumber==-1)
                {
                  randTrivia=(int)random(6,8);
                  triviaNumber=randTrivia;
                }
              }
              if(counter==14 && questionTime==true)
              {
                if(triviaNumber==-1)
                {
                  randTrivia=8;
                  triviaNumber=randTrivia;
                }
              }
             }
           }
           
            if(triviaNumber!=-1 && questionTime==true)
            {
              timer=0;
              displayCurrentBattle=false;
              drawBorderTitle(questionsTitle[randTrivia],405,240);
              textAlign(LEFT);
              textFont(font3);
              text(questions[randTrivia],100,290);
              textAlign(CENTER);
              if(power.equals("Central Power"))
              {
                text("Your ally, Germany, asks you this question:",405,200);
              }
              else
              {
                text("Your ally, France, asks you this question:",405,200);
              }
              textAlign(LEFT);
              text("Type a, b, c, or d on the keyboard to answer the question. If you provide the correct information, your ally will provide you with 25,000 troops and 5 crates of food.",85,510,660,100); 
            }
            
              if(keyPressed && questionTime==true) 
              {
                if (key == 'a' || key == 'A') 
                {
                  if(answers[randTrivia].equals("a"))
                  {
                      text("Correct!",520,380);
                      troopCount+=25000;
                      foodCount+=5;
                  }
                  else
                  {
                     text("Correct answer was " + answers[randTrivia], 470,380); 
                  }
                    triviaNumber=-1;
                    questionTime=false;
                    timer=0;
                }
                if (key == 'b' || key == 'B') 
                {
                  if(answers[randTrivia].equals("b"))
                  {
                      text("Correct!",520,380);
                      troopCount+=25000;
                      foodCount+=5;
                  }
                  else
                  {
                     text("Correct answer was " + answers[randTrivia], 470,380); 
                  }
                    triviaNumber=-1;
                    questionTime=false;
                    timer=0;
                }
                if (key == 'c' || key == 'C') 
                {
                  if(answers[randTrivia].equals("c"))
                  {
                      text("Correct!",520,380);
                      troopCount+=25000;
                      foodCount+=5;
                  }
                  else
                  {
                     text("Correct answer was " + answers[randTrivia], 470,380); 
                  }
                    triviaNumber=-1;
                    questionTime=false;
                    timer=0;                 
                }
                if (key == 'd' || key == 'D') 
                {
                  if(answers[randTrivia].equals("d"))
                  {
                      text("Correct!",520,380);
                      troopCount+=25000;
                      foodCount+=5;
                  }
                  else
                  {
                     text("Correct answer was " + answers[randTrivia], 470,380); 
                  }
                    triviaNumber=-1;
                    questionTime=false;
                    timer=0;
                }                
            }
          
        if(dispWeaponsInfo)
        {
          timer=0;
          drawBorderTitle("Weapons Used in World War 1",405,190);
          String textInfo="\nRifles were commonly used by British soldiers in the trenches. A rifle had a firing range of 1,400 meters and 15 rounds could be fired in a minute.\n\nMachine guns were very powerful weapons, having the fire-power of 100 guns. Machine guns needed 4-6 men to use and needed a flat surface.  \n\nPoison gas was a very deadly weapon. Chlorine gas leads to death by suffocation as well as throat and chest pains. Mustard gas was the most deadly weapon used in the war. The gas is colorless and was easily fired into trenches where the soldiers hid. They experienced vomiting, sore eyes, internal and external bleeding, and blistering skin. Death could have taken up to 5 weeks.";
          String textInfo2="\nZeppelins or blimps were airships that carried machine guns and bombs. They were easy to shoot from the sky and thus were not effective.\n\nTanks were powerful but somewhat ineffective. Its maximum speed was 3 miles per hour and could not cross trenches where soldiers hid.\n\nPlanes initially were used for transportation of bombs and spying, but later on they became fighter planes armed with machine guns, bombs, and cannons.\n\nTorpedoes were used by German submarines to destroy enemy ships. ";
          textAlign(LEFT);
          textFont(font3);
          if(!weaponsNext)
          {
            text(textInfo,90,210,775-150,548-170);
          }
          else
          {
            text(textInfo2,90,210,775-150,548-170);
          }
        }
        
        if(dispJoinedInfo)
        {
          timer=0;
          drawBorderTitle("Why Countries Joined World War 1",405,190);
          fill(0);
          String before="Before the war…";
          String start="At the start of the war…";
          String during="During the war...";
          String textInfo="\n\n          In 1882, Austria-Hungary, Germany, and Italy created the Triple Alliance. This treaty was to assist the other countries with military assistance if war was declared. In 1907, the Triple Entente was formed between France, Britain, and Russia. This alliance opposed the Triple Alliance.\n\n\n\n          Archduke Franz Ferdinand of Austria and his wife Sophie were assassinated in June 28, 1914. The assassination led to Austria-Hungary declaring war against Serbia. In July, being part of the Triple Alliance, the German Empire gave support to Austria-Hungary against Serbia.\n\n          The Russian Empire lent support to Serbia in a separate agreement from the Triple Alliance and the Triple Entente. In August of 1914, Germany then declared war on both France and Russia. Germany moved troops to the neutral country of Belgium on August 4, 1914 to attack France. England demanded for the retreat of German soldiers, and when the German Empire refused, Britain declared war on Germany.";
          String textInfo2="\n\n          On October 28, 1914, the Ottoman Empire joined the Central Powers due to the signing of the Turco-German Alliance.  \n\n          In August of 1915, Italy declares war on Germany and Austria. Although Italy was originally in the Triple Alliance, Italy waited to see how the war progressed before joining the war. Italy signed a secret Treaty of London in which Britain would give Italy territories in the Adriatic Sea. The Allied Powers wanted Italy so that there would be more fronts to attack Germany from, thus weakening Germany.\n\n          In America, President Woodrow Wilson wanted to be neutral in World War 1. In May of 1915, a German submarine had sunk Lusitania, which was an ocean liner that traveled between New York City and Liverpool, England. Although 128 Americans lost their lives, the United States still did not enter the war. Germany then claimed unrestricted submarine warfare which means that they could sink ships without warning which angered Wilson. The final push was the Zimmerman note in which Germany was persuading Mexico to declare war on the United States. Congress declared war on Germany on April 6, 1917.";
          
          textAlign(LEFT);
          if(!joinedNext)
          {
              textFont(font);
              text(before,90,230);
              text(start,90,365);
              textFont(font6);
              text(textInfo,90,210,775-150,548-170);
          }
          else
          {
              textFont(font);
              text(during,90,230);
              textFont(font6);
              text(textInfo2,90,210,775-150,548-170);
          }
        }
        
        if(dispStrategiesInfo)
        {
          timer=0;
          
          drawBorderTitle("Strategies of World War 1",405,190);
          
          String sPlan="Schlieffen Plan";
          String tWarfare="Trench Warfare";
          String hLine="Hindenburg Line";
          String hdOffensive="Hundred Days Offensive";
          String textInfo="\n\n          Germany feared fighting from several fronts which was what happened during World War 1. Having France to the west and Russia to the east, the Schlieffen Plan was created to avoid a two-front war. The plan was to concentrate troops in the west to quickly defeat the French, then move them to the East to defeat Russia.\n\n\n\n          This was a strategy employed by both the Central Powers and Allied Powers. Large trenches were dug for protection. The trenches provided immunity for small arms fire and artillery. The progress of the war was delayed by the use of trench warfare as it was slow to bring down the opposing force. Life in the trenches was difficult with daily deaths in the trenches. There were rat and lice infestations as well as fungal infections like Trench Foot.";
          String textInfo2="\n\n          The Hindenberg Line was a large system of defenses for the German army.  It was constructed in the winter of 1916 to 1917 by Russian prisoners of War. The Hindenberg Line was located in Northeastern France. The line had concrete bunkers with lots of barbed wire. There were tunnels, deep trenches, dug outs, and command posts.\n\n\n\n          This was the final period of World War 1 where the Allies launched a series of successful attacks on the Central Powers from August 8, 1918 to November 11, 1918. The offensive forced Germany out of the Hindenberg Line.";

          textAlign(LEFT);
          if(!strategiesNext)
          {
              textFont(font);
              text(sPlan,90,230);
              text(tWarfare,90,385);
              textFont(font6);
              text(textInfo,90,210,775-150,548-170);
          }
          else
          {
              textFont(font);
              text(hLine,90,230);
              text(hdOffensive,90,385);
              textFont(font6);
              text(textInfo2,90,210,775-150,548-170);
          }
        } 
      }
      
            if(counter==15)
      {
         winGame=true; 
         gamePlay=false;
      }
  }

   else if(gameOver)
    {
       makeEndScreen("Sorry, you didn't survive the war.");
    }
    else if(winGame)
    {
      makeEndScreen("Congratulations! You survived the war.");
    }
}

void displayTitle()
{
  int xText=80;
  int yText=70;
  textAlign(LEFT);
  textFont(font7);
  
    fill(153,206,255);
  text("Once  Upon  a  War . . .",xText+2,yText);
  text("Once  Upon  a  War . . .",xText,yText+2);
  text("Once  Upon  a  War . . .",xText+2,yText+2);
  text("Once  Upon  a  War . . .",xText+2,yText);
  text("Once  Upon  a  War . . .",xText,yText+2);
  text("Once  Upon  a  War . . .",xText+2,yText+2);
  
  text("Once  Upon  a  War . . .",xText-2,yText);
  text("Once  Upon  a  War . . .",xText,yText-2);
  text("Once  Upon  a  War . . .",xText-2,yText-2);
  text("Once  Upon  a  War . . .",xText-2,yText);
  text("Once  Upon  a  War . . .",xText,yText-2);
  text("Once  Upon  a  War . . .",xText-2,yText-2);
  
  fill(0);
  text("Once  Upon  a  War . . .",xText,yText);
}

void makeEndScreen(String title)
{
          //Borders
          strokeWeight(3);
          fill(153,206,255);
          rect(0,0,width,height);
          fill(112,255,146);
          rect(10,10,width-20,height-20);
          fill(255,246,109);
          rect(20,20,width-40,height-40);
          fill(0);
          textFont(font4);
          textAlign(CENTER);
          text(title,width/2,80);
          textFont(font3);
          String finalTroopCount=nfc(troopCount);
          text("Final Troop Count:  "+ finalTroopCount,width/2,130);
          text("Thank you for playing Once Upon a War. I hope you had fun and learned more about World War 1.\n\nIf you would like to learn more about World War 1, there are great websites that provide additional information. The purpose of this project was to create a more interactive way of learning. By providing the information in the format of a game, hopefully students will have fun while learning and will play enough to remember the information. In the making of this game, I myself learned a lot about World War 1 and hope that it will help other people too.",55,160, width-100,height-70);
          textFont(font);
          text("References:",width/2,380);
          text("Timeline Information:",width/4,430);
          text("Images:",3*width/4,400);
          textFont(font3);
          text("www.historylearningsite.co.uk/timeline_of_world_war_one.htm\nwww.wikipedia.org",width/4,460);
          text("sikhphilosophy.net\nwikipedia.org\nfirstwarworld.com\nhistorycentral.com",3*width/4,430);
          text("Created for the Human Computer Interaction class at the University of Florida\nCreated by Kimberly Chan",width/2,580);
}

void displayWeaponry()
{
  fill(0);
  textFont(font);
  text("Weapons Accumulated:",820,290);
  text("Food Crate Count:",820,410);
   for(int i=0; i<counter; i++)
  {
    if(i<=6)
    {
      if(weapons2[i]!=null)
      {
         image(weapons2[i],830+(i*50),305);
        //image(weapons[i].displayIcon,830+(i*50),305);
      }
    }
    else if(i<=14 && i>6)
     {
       if(weapons2[i]!=null)
      {
         image(weapons2[i],830+(i-7)*50,350);
         //image(weapons[i].displayIcon,830+(i-7)*50,350);
      }
     }
  } 
  for(int j=0;j<foodCount;j++)
  {
    if(j<9)
    {
      if(j%2==0)
      {
         image(foodCrateIcon,830+(j*40),420);
      }
      else
      {
        image(foodCrateIcon2,830+(j*40),420);
      }
    }
    else if(j<18 && j>=9)
    {
      if(j%2==0)
      {
        image(foodCrateIcon,830+((j-9)*40),455);
      }
      else
      {
         image(foodCrateIcon2,830+((j-9)*40),455); 
      }     
    }
    else if(j<27 && j>=18)
    {
      if(j%2==0)
      {
         image(foodCrateIcon,830+((j-18)*40),490);
      }
      else
      {
        image(foodCrateIcon2,830+((j-18)*40),490);
      }
    }
    else if(j<36 && j>=27)
    {
      if(j%2==0)
      {
           image(foodCrateIcon,830+((j-27)*40),525); 
      }
      else
      {
          image(foodCrateIcon2,830+((j-27)*40),525); 
      }   
    }
  }
}

void drawBorderTitle(String title, int xLoc, int yLoc)
{
          fill(0,0,0,140);
          rect(15,100,775,548);
          //Borders
          strokeWeight(3);
          fill(153,206,255);
          rect(50,135,775-70,548-70);
          fill(112,255,146);
          rect(60,145,775-90,548-90);
          fill(255,246,109);
          rect(70,155,775-110,548-110);
          
          textFont(font2);          
          textAlign(CENTER);
          
          fill(153,206,255);
          text(title,xLoc+1,yLoc+1); 
          fill(0);
          text(title,xLoc,yLoc); 
}

void displayBattle(int counter)
{
          fill(0,0,0,100);
          rect(15,100,775,548);
          
          //Borders
          strokeWeight(3);
          fill(153,206,255);
          rect(50,135,775-70,548-70);
          fill(112,255,146);
          rect(60,145,775-90,548-90);
          fill(255,246,109);
          rect(70,155,775-110,548-110);
          fill(0);

          textFont(font4);
          textAlign(CENTER);
          fill(153,206,255);          
          text(battles[counter].name,407,197);
          fill(0);
          text(battles[counter].name,405,195); 
          textFont(font3);
          text(battles[counter].date,405,220);
          textAlign(LEFT);
          image(battles[counter].pic,735-20-battles[counter].picX,230+((340-battles[counter].picY)/2));
          textFont(font5);
          text(battles[counter].description+"\n\nVictors: "+battles[counter].victor,90,240,735-20-20-90-battles[counter].picX,320);
}

void displayBattleFull(int counter)
{
          fill(0,0,0,100);
          rect(15,100,775,548);
          
          //Borders
          strokeWeight(3);
          fill(153,206,255);
          rect(50,135,775-70,548-70);
          fill(112,255,146);
          rect(60,145,775-90,548-90);
          fill(255,246,109);
          rect(70,155,775-110,548-110);
          fill(0);

          textFont(font4);
          textAlign(CENTER);
          text(battles[counter].name,405,195); 
          textFont(font3);
          text(battles[counter].date,405,220);
          image(battles[counter].pic,735-20-battles[counter].picX,230+((340-battles[counter].picY)/2));          
            
            String displayMedSaved=nfc(medSaved);
            
            int totalWeapons=0;
            for(int i=0;i<=counter;i++)
            {
//                if(weapons[i]!=null)
//                {
                   //totalWeapons+=weapons[i].value; 
                   totalWeapons+=weapons3[i];
//                }
            }
            
            String displayWeaponsTotal=nfc(totalWeapons);
                       
            troopsEarned=(2*troopCountDice*10000);
            String displayTroopsEarned=nfc(troopsEarned);
            
             int foodEarned=foodCountDice*2;
            String displayFoodEarned=nfc(foodEarned);
            
            int foodEaten=troopCount/400000;
            String displayFoodEaten=nfc(foodEaten);
          
          if(power.equals("Allied Power"))
          {
            String displayCasualties=nfc(battles[counter].alliedCasualties);
            totalCasualties=battles[counter].alliedCasualties-medSaved-totalWeapons;
            
            if(totalCasualties<0)
            {
               totalCasualties=0; 
            }
            String displayTotalCasualties=nfc(totalCasualties);
            
            textAlign(LEFT);
            textFont(font3);
            
            text("Expected Allied Power Casualties:",90,260);
            text("Medicine saved " + displayMedSaved + " soldiers. \n\nWeapons saved " + displayWeaponsTotal + " soldiers. \n\nTotal Number of Casualties: " + displayTotalCasualties + "\n\nNumber of Troops Earned: " + displayTroopsEarned + "\n\nNumber of Food Crates Earned: "+displayFoodEarned + "                     Crates of Food Eaten: "+displayFoodEaten,90,325);
            
            textAlign(CENTER);
            textFont(font);
            text(displayCasualties,205,285);
          }
          else
          {
            String displayCasualties=nfc(battles[counter].centralCasualties);
            totalCasualties=battles[counter].centralCasualties-medSaved-totalWeapons;
            
            if(totalCasualties<0)
            {
               totalCasualties=0; 
            }
            String displayTotalCasualties=nfc(totalCasualties);
            
            textAlign(LEFT);
            textFont(font3);
            
            text("Expected Central Power Casualties:",90,260);
            text("Medicine saved " + displayMedSaved + " soldiers. \n\nWeapons saved " + displayWeaponsTotal + " soldiers. \n\nTotal Number of Casualties: " + displayTotalCasualties + "\n\nNumber of Troops Earned: " + displayTroopsEarned + "\n\nNumber of Food Crates Earned: "+displayFoodEarned+ "                     Crates of Food Eaten: "+displayFoodEaten,90,325);
            
            textAlign(CENTER);
            textFont(font);
            text(displayCasualties,205,285);
          }
//          int foodEarned=foodCountDice*2;
//          String displayFoodEarned=nfc(foodEarned);
//          text("Number of Food Crates Earned: "+dispalyFoodEarned,
}

void checkFood()
{
    int foodEaten=troopCount/400000;
    foodCount-=foodEaten;
}

void displayWeaponsInfo()
{
      //Create a return to weaponsInfo 
      String wi="Weapons used in World War 1";
      int wiWidth = (int) textWidth(wi);
      weaponsInfo=new Rectangle(880,60,wiWidth,30);
      if(weaponsInfo.contains(mouseX,mouseY))
      {
         fill(153,206,255);
      }
      else
      {
         fill(0); 
      }
      textAlign(CENTER);
      text(wi,1000,70);
      textAlign(LEFT);
}

void displayJoinInfo()
{
       //Create a return to joinedInfo 
      String ji="Why Countries Joined World War 1";
      int jiWidth = (int) textWidth(ji);
      joinedInfo=new Rectangle(860,100,jiWidth,30);
      if(joinedInfo.contains(mouseX,mouseY))
      {
         fill(153,206,255);
      }
      else
      {
         fill(0); 
      }
      textAlign(CENTER);         
      text(ji,1000,110);
      textAlign(LEFT);
}

void displayStrategiesInfo()
{
    //Create a return to joinedInfo 
      String si="Strategies of World War 1";
      int siWidth = (int) textWidth(si);
      strategiesInfo=new Rectangle(900,140,siWidth,30);
      if(strategiesInfo.contains(mouseX,mouseY))
      {
         fill(153,206,255);
      }
      else
      {
         fill(0); 
      }
      textAlign(CENTER);         
      text(si,1000,150);
      textAlign(LEFT);
}
      
void displayMap()
{
  String displayTroopCount=nfc(troopCount);
  String displayFoodCount=nfc(foodCount);

  //Display Europe
   fill(0);
   rect(13,98,777,550);
   image(europeMap,15,100);
   
   if(assignColor || chooseSide)
   {
     textAlign(LEFT);
     textFont(font2);
     text("Total Number of Troops: " + displayTroopCount, 820, 120);
     text("Total Crates of Food: " + displayFoodCount, 820, 160);
   }
   else if(gamePlay)
   {
     textAlign(LEFT);
     textFont(font2);
     text("Total Number of Troops: " + displayTroopCount, 820, 210);
     text("Total Crates of Food: " + displayFoodCount, 820, 250);
   }
   
   textFont(font);
   //Display color
   for(int j=0; j<19; j++)
   {
     if(displayCountryColor[j]!=-1)
     {
         image(europe[displayCountryColor[j]].mapColor,15,100);
     }
     else
     {
        break; 
     }
   }
   
}

void displayCountryNames()
{
  textFont(font);
   fill(255);
         //Display text name of countries
   for(int i=0; i<19; i++)
   {
        text(europe[i].name,europe[i].x+1,europe[i].y); 
        text(europe[i].name,europe[i].x-1,europe[i].y); 
        text(europe[i].name,europe[i].x,europe[i].y-1); 
        text(europe[i].name,europe[i].x,europe[i].y+1); 
        
        text(europe[i].name,europe[i].x+2,europe[i].y); 
        text(europe[i].name,europe[i].x-2,europe[i].y); 
        text(europe[i].name,europe[i].x,europe[i].y-2); 
        text(europe[i].name,europe[i].x,europe[i].y+2); 
        
        text(europe[i].name,europe[i].x+2,europe[i].y+2); 
        text(europe[i].name,europe[i].x-2,europe[i].y-2); 
        text(europe[i].name,europe[i].x-2,europe[i].y+2); 
        text(europe[i].name,europe[i].x-2,europe[i].y+2); 
   }  
  fill(50,77,142);
      //Display text name of countries
   for(int i=0; i<19; i++)
   {
        text(europe[i].name,europe[i].x,europe[i].y); 
   }  

   fill(0);
}

void displayAssignColorDirections()
{
    pushMatrix();
    strokeWeight(3);
    stroke(0);
    fill(255);
    rect(820,310,350,320);
    popMatrix();
    
    fill(0);
    textFont(font2);
    String directionsMapColor="Directions for Assigning Map Colors";
    text(directionsMapColor,840,320,340,320);
    textFont(font3);
    text("       Your mission is to determine which blank country is part of the Allied Powers or part of the Central Powers. Drag and drop the yellow or green soldier on top of the country's name to assign the country the color. If you assign the power correctly, you will receive 50,000 soldiers as well as a crate of food. If you are incorrect, the real color will be displayed on the map.",830,350,340,320);
}

void displayChooseSide()
{
    pushMatrix();
    strokeWeight(3);
    stroke(0);
    fill(255);
    rect(820,310,355,300);
    popMatrix();
    
    textAlign(CENTER);
    fill(0);
    textFont(font2);
    String directionsMapColor="Choose a Side\n\nClick on the yellow soldier for Central Power or the green soldier for Allied Power. You will have the same number of casualties that your power had in each major battle of the war.";
    text(directionsMapColor,830,330,340,320);
    textAlign(LEFT);
}

void displayReviewInstructions()
{
    //Create a return to instructions box      
      String ri="Review Instructions";
      int riWidth = (int) textWidth(ri);
      returnToInstructions=new Rectangle(1025,0,riWidth,40);
      if(returnToInstructions.contains(mouseX,mouseY))
      {
         fill(153,206,255);
      }
      else
      {
         fill(0); 
      }
      textAlign(LEFT);
      text(ri,1025,20);
}

void mouseReleased()
{
  found=false;
   for (int i=0; i<19; i++)
  {
    if(yellowSelected==true || greenSelected==true)
     {
       if(europe[i].rec.contains(mouseX,mouseY))
       {
          found=true;         
          boolean sameName=false;
          for(int j=0; j<19; j++)
          {
              if(displayCountryColor[j]!=-1)
              {
                if(europe[displayCountryColor[j]].name.equals(europe[i].name))
                {
                   sameName=true; 
                }
              }
             else
              {
                 if(!sameName)
                 {
                   displayCountryColor[j]=i;
                     if(winner.equals(europe[i].power))
                    {
                       troopCount+=50000;
                       foodCount+=1;
                    }
                    winner="";
                   break;
                 } 
             }
          }
       }
    }
  } 
  if(!found)
  {
     displayError=true;
  }
}

void mousePressed()
{
  if(game==true && assignColor==true)
  {
   if(recYellow.contains(mouseX,mouseY))
      {
         start=false;
         yellowSelected=true;
      }   
   if(recGreen.contains(mouseX,mouseY))
      {
         start=false;
         greenSelected=true;
      }  
      displayError=false;
      timer=0;
  }
}

void mouseClicked()
{
   if(titleScreen)
  {
     titleScreen=false;
     instructions=true;
  } 
  else if(instructions)
  {
      instructions=false;
      instructions2=true;
  }
  else if(instructions2)
  {
      instructions2=false;
      game=true;
      if(inGame)
      {
         gamePlay=true; 
      }
      else if(assignColor)
      {
         assignColor=true;
         start=true;
      }
  }

  else if(game)
  {
    if(returnToInstructions.contains(mouseX,mouseY))
      {
         game=false;
         instructions=true;
      }

      if(chooseSide)
      {
        if(recYellow.contains(mouseX,mouseY))
        {          
          fill(255);
          strokeWeight(3);
          stroke(153,206,255);
          rect(860,180,85,85);
                
         image(yellowGuy,865,185);
         image(greenGuy,1035,185);
         
          power="Central Power";
          chooseSide=false;
          gamePlay=true;
          timer=0;
        }
        if(recGreen.contains(mouseX,mouseY))
        {
          fill(255);
          strokeWeight(3);
          stroke(153,206,255);
          rect(1030,180,85,85);
                
         image(yellowGuy,865,185);
         image(greenGuy,1035,185);
       
          power="Allied Power";
          chooseSide=false;
          gamePlay=true;
          timer=0;
        }
      }
      
      else if (gamePlay)
      {   
        if(displayCurrentBattle)
        {
           if(recMed.contains(mouseX,mouseY))
           {
              if(medicineCount==-1)
              {
                 medicineCount=randomMed;
              }
           }
           if(recFood.contains(mouseX,mouseY))
           {
               if(foodCountDice==-1)
               {
                 foodCountDice=randomFood;
               }
           }
           if(recWeapon.contains(mouseX,mouseY))
           {
             if(weaponNumber==-1)
               {
                 weaponNumber=randomWeapon;
               }
           }
           if(recTroop.contains(mouseX,mouseY))
           {
             if(troopCountDice==-1)
               {
                 troopCountDice=randomTroop;
               }
           }
        }
      
         if(weaponsInfo.contains(mouseX,mouseY))
         {
           dispWeaponsInfo=true;
           dispStrategiesInfo=false;
           dispJoinedInfo=false;
         }
         if(joinedInfo.contains(mouseX,mouseY))
         {
           dispJoinedInfo=true;
           dispStrategiesInfo=false;
           dispWeaponsInfo=false;
         }
         if(strategiesInfo.contains(mouseX,mouseY))
         {
           dispStrategiesInfo=true;
           dispJoinedInfo=false;
           dispWeaponsInfo=false;           
         }
        
        //Close display review
        if(displayReviewBattle)
        {
            reviewNumber=-1;
            displayReviewBattle=false;
            timer=0;
        }
        
        //If mouse clicked on a battle location, display the battle information
        for(int i=0; i<counter; i++)
        {
           if( mouseX>battles[i].x-10 && mouseX<battles[i].x+10 && mouseY>battles[i].y-10 && mouseY<battles[i].y+10 )
           {
               reviewNumber=i;
               displayReviewBattle=true;
           }
        }
      }
      
  if(mouseX>15 && mouseX<790 && mouseY>100 && mouseY<648)
  {
    if (battleview)
    {
      foodCount+=(2*foodCountDice);
      checkFood();
      medicineCount=-1;
      medSaved=0;
      foodCountDice=-1;
      weaponNumber=-1;
      troopCountDice=-1; 
      troopCount=troopCount-totalCasualties+troopsEarned; 
      counter++;
      timer=0;
      battleview=false;
     if(counter==15)
      {
        timer++;
        game=false;
         gamePlay=false;
         winGame=true; 
      }
    }
        
    if(weaponsNext)
    {
      weaponsNext=false;
      dispWeaponsInfo=false;
      timer=0;
    }
    else if(dispWeaponsInfo)
    {
      weaponsNext=true;
    }
    
    if(joinedNext)
    {
       joinedNext=false;
       dispJoinedInfo=false; 
       timer=0;
    }
    else if(dispJoinedInfo)
    {
      joinedNext=true;
    }
    
    if(strategiesNext)
    {
      strategiesNext=false;
      dispStrategiesInfo=false;
      timer=0;
    }
    else if(dispStrategiesInfo)
    {
      strategiesNext=true;
    } 
  }
   }
}

void checkBoundary()
{
   if(mouseX+buttonWidth/2>=width)
   {
       mouseX=width-buttonWidth/2;
   }
   if(mouseX-buttonWidth/2<=0)
   {
      mouseX=0+buttonWidth/2; 
   }
   if(mouseY+buttonHeight/2>=height)
   {
       mouseY=height-buttonHeight/2;
   }
   if(mouseY-buttonHeight/2<=0)
   {
      mouseY=0+buttonHeight/2; 
   }
}

class Country
{
    Rectangle rec;
    PImage mapColor;
    public String power;
    public int x;
    public int y;
    public String name;
    
    public Country(String imageName, int xPos, int yPos, String thePower, String theName)
    {
      fill(0);
       mapColor=loadImage(imageName);
       name=theName;
       //text(name,xPos,yPos);
       int width = (int) textWidth(name);
       rec=new Rectangle(xPos+15-10,yPos-15,width+20,35);
       power=thePower;
       x=xPos+15;
       y=yPos;
    }
}

class Battle
{
   public String name; 
   public String date;
   public String victor; 
   public int alliedCasualties;
   public int centralCasualties;
   PImage pic;
   public int x;
   public int y;
   public String description;
   public int picX;
   public int picY;
   
   public Battle(String theName, String theDate, String theVictor, int cas1, int cas2, String thePicName, int xCoor, int yCoor, String theDescription, int thepicX, int thepicY)
   {
       name=theName;
       date=theDate;
       victor=theVictor;
       alliedCasualties=cas1;
       centralCasualties=cas2;
       pic=loadImage(thePicName);
       x=xCoor;
       y=yCoor;
       description=theDescription;
       picX=thepicX;
       picY=thepicY;
   }
 }
 
 
void loadExcel()
{
   //Columns 
   int nameCol=0;
   int dateCol=1;
   int victorCol=2;
   int alliedCol=3;
   int centralCol=4;
   int picCol=5;
   int xCol=6;
   int yCol=7;
   int desCol=8;
   int picSizeX=9;
   int picSizeY=10;
   
   String name; 
   String date;
   String victor; 
   int alliedCasualties;
   int centralCasualties;
   String picName;
   int x;
   int y;
   String description;
   int picX;
   int picY;
   
   int rowStart=1;
   int rowEnd=15;
   
   excelReader=new XlsReader(this,"ww1Battles.xls");
   battles=new Battle[15];
   for(int i=rowStart; i<=rowEnd; i++)
   {
       name=excelReader.getString(i,nameCol);
       date=excelReader.getString(i,dateCol);
       victor=excelReader.getString(i,victorCol);
       alliedCasualties=excelReader.getInt(i,alliedCol);
       centralCasualties=excelReader.getInt(i,centralCol);
       picName=excelReader.getString(i,picCol);
       x=excelReader.getInt(i,xCol);
       y=excelReader.getInt(i,yCol);
       description=excelReader.getString(i,desCol);
       picX=excelReader.getInt(i,picSizeX);
       picY=excelReader.getInt(i,picSizeY);
       battles[i-1]=new Battle(name,date,victor,alliedCasualties,centralCasualties,picName,x,y,description,picX,picY);
   }
}

class Weapon
{
   public String name;
   public int value;
   public String iconName;
   public String diceIconName;
   PImage displayIcon;
   PImage weaponDice;
   
   public Weapon(String theName, int theValue, String icon, String diceIcon)
   {
      name=theName;
      value=theValue;
      iconName=icon;
      diceIconName=diceIcon;
      displayIcon=loadImage(icon);
      weaponDice=loadImage(diceIcon);
   }
}

