
//Project 2 Another Data Visualization, because I love them.
//Copyright Kristen McConnell, Pittsburgh, PA, December 2011

//Data: Department of Biological Sciences Faculty Research Areas
//Source: http://www.cmu.edu/bio/research/

//Button Variables
float bioChemX, bioTechX, cellBioX, compBioX, devBioX, genomicsX, molBioX, neuroX;
float buttonY, buttonWidth, buttonHeight;

//Image Arrays
PImage  ahrens, 
        barth, 
        bruchez, 
        durand, 
        ettensohn, 
        hackney, 
        ho, 
        hollinger, 
        jarvik, 
        lanni, 
        lee, 
        linstedt, 
        lopez, 
        macbeth, 
        mccartney, 
        mcmanus, 
        minden, 
        mitchell, 
        murphy, 
        puthenveedu, 
        rule, 
        schwartz, 
        urban, 
        waggoner, 
        woolford;
        
PImage [] facultyArray;
PFont MyriadProCond, MyriadProBold, MyriadProSmall, MyriadProBoldSmall;
int MAX = 25;

//Width & Height of the Screen
int wt = 700;
int ht = 700;

void setup()
{
 //Preping the Screen
 size(700,700);
 
 //Loading Images
 ahrens = loadImage("ahrens.jpg");
 barth = loadImage("barth.jpg");
 bruchez = loadImage("bruchez.jpg"); 
 durand = loadImage("durand.jpg");
 ettensohn = loadImage("ettensohn.jpg");
 hackney = loadImage("hackney.jpg");
 ho = loadImage("ho.jpg");
 hollinger = loadImage("hollinger.jpg");
 jarvik = loadImage("jarvik.jpg");
 lanni = loadImage("lanni.jpg");
 lee = loadImage("lee.jpg");
 linstedt = loadImage("linstedt.jpg");
 lopez = loadImage("lopez.jpg");
 macbeth = loadImage("macbeth.jpg");
 mccartney = loadImage("mccartney.jpg");
 mcmanus = loadImage("mcmanus.jpg");
 minden = loadImage("minden.jpg");
 mitchell = loadImage("mitchell.jpg");
 murphy = loadImage("murphy.jpg");
 puthenveedu = loadImage("puthenveedu.jpg");
 rule = loadImage("rule.jpg");
 schwartz = loadImage("schwartz.jpg");
 urban = loadImage("urban.jpg");
 waggoner = loadImage("waggoner.jpg");
 woolford = loadImage("woolford.jpg");
 
 //Loads Fonts
 MyriadProCond = loadFont("MyriadPro-Cond-13.vlw");
 MyriadProBold = loadFont("MyriadPro-Bold-20.vlw");
 MyriadProSmall = loadFont("MyriadPro-Cond-11.vlw");
 MyriadProBoldSmall = loadFont("MyriadPro-Bold-11.vlw");
 
 //Set Up the Buttons
 buttonSetUp();
 
 facultyArray = new PImage[MAX];
}

//String of All faculty Members Names
String [] facultyNames = {"Ahrens",
                     "Barth",
                     "Bruchez",
                     "Durand",
                     "Ettensohn",
                     "Hackney",
                     "Ho",
                     "Hollinger",
                     "Jarvik",
                     "Lanni",
                     "Lee",
                     "Linstedt",
                     "Lopez",
                     "Macbeth",
                     "McCartney",
                     "McManus",
                     "Minden",
                     "Mitchell",
                     "Murphy",
                     "Puthenveedu",
                     "Rule",
                     "Schwartz",
                     "Urban",
                     "Waggoner",
                     "Woolford",
                     };
                     
//X Locations for All Faculty Images
float [] xPosition = {wt*.225, //ahrens
                     wt*.325, //barth
                     wt*.425, //bruchez
                     wt*.525,//durand
                     wt*.625,//ettensohn
                     wt*.725,//hackney
                     wt*.225,//ho
                     wt*.325,//hollinger
                     wt*.425,//jarvik
                     wt*.525,//lanni
                     wt*.625, //lee
                     wt*.725,//linstedt
                     wt*.225,//lopez
                     wt*.325,//macbeth
                     wt*.425,//mccartney
                     wt*.525,//mcmanus
                     wt*.625,//minden
                     wt*.725,//mitchell
                     wt*.175,//murphy
                     wt*.275,//puthenveedu
                     wt*.375,//rule
                     wt*.475,//schwartz
                     wt*.575,//urban
                     wt*.675,//waggoner
                     wt*.775,//woolford
                     };
                     
//Y Locations for Faculty Images
float [] yPosition = {ht*.15, //ahrens
                     ht*.15, //barth
                     ht*.15, //bruchez
                     ht*.15,//durand
                     ht*.15,//ettensohn
                     ht*.15,//hackney
                     ht*.25,//ho
                     ht*.25,//hollinger
                     ht*.25,//jarvik
                     ht*.25,//lanni
                     ht*.25, //lee
                     ht*.25,//linstedt
                     ht*.35,//lopez
                     ht*.35,//macbeth
                     ht*.35,//mccartney
                     ht*.35,//mcmanus
                     ht*.35,//minden
                     ht*.35,//mitchell
                     ht*.45,//murphy
                     ht*.45,//puthenveedu
                     ht*.45,//rule
                     ht*.45,//schwartz
                     ht*.45,//urban
                     ht*.45,//waggoner
                     ht*.45,//woolford
                     };

//Group of Faculty Members who Study Neuroscience                     
boolean [] neuro = {true, //ahrens
                     true, //barth
                     true, //bruchez
                     false,//durand
                     false,//ettensohn
                     false,//hackney
                     false,//ho
                     false,//hollinger
                     false,//jarvik
                     false,//lanni
                     false, //lee
                     false,//linstedt
                     false,//lopez
                     true,//macbeth
                     false,//mccartney
                     false,//mcmanus
                     false,//minden
                     false,//mitchell
                     false,//murphy
                     true,//puthenveedu
                     false,//rule
                     false,//schwartz
                     true,//urban
                     false,//waggoner
                     false,//woolford
                     };

//Group of Faculty Members who Study Molecular Biology and Genetics                                         
boolean [] molBio = {false, //ahrens
                     false, //barth
                     false, //bruchez
                     false,//durand
                     true,//ettensohn
                     false,//hackney
                     false,//ho
                     false,//hollinger
                     true,//jarvik
                     false,//lanni
                     false, //lee
                     true,//linstedt
                     true,//lopez
                     true,//macbeth
                     true,//mccartney
                     false,//mcmanus
                     true,//minden
                     true,//mitchell
                     false,//murphy
                     true,//puthenveedu
                     false,//rule
                     true,//schwartz
                     false,//urban
                     false,//waggoner
                     true,//woolford
                     };
                     
//Group of Faculty Members who Study Genomics, Proteomics & Systems Biology                                         
boolean [] genomics = {false, //ahrens
                     false, //barth
                     false, //bruchez
                     true,//durand
                     true,//ettensohn
                     false,//hackney
                     false,//ho
                     true,//hollinger
                     true,//jarvik
                     false,//lanni
                     false, //lee
                     false,//linstedt
                     true,//lopez
                     false,//macbeth
                     false,//mccartney
                     false,//mcmanus
                     true,//minden
                     true,//mitchell
                     false,//murphy
                     false,//puthenveedu
                     false,//rule
                     true,//schwartz
                     true,//urban
                     false,//waggoner
                     true,//woolford
                     };
                     
//Group of Faculty Members who Study Developmental Biology                                       
boolean [] devBio = {false, //ahrens
                     true, //barth
                     false, //bruchez
                     false,//durand
                     true,//ettensohn
                     false,//hackney
                     false,//ho
                     false,//hollinger
                     false,//jarvik
                     false,//lanni
                     false, //lee
                     false,//linstedt
                     true,//lopez
                     false,//macbeth
                     true,//mccartney
                     false,//mcmanus
                     true,//minden
                     false,//mitchell
                     false,//murphy
                     false,//puthenveedu
                     false,//rule
                     false,//schwartz
                     false,//urban
                     false,//waggoner
                     false,//woolford
                     };
                     
//Group of Faculty Members who Study Computational Biology & Bioinformatics                                     
boolean [] compBio = {false, //ahrens
                     false, //barth
                     false, //bruchez
                     true,//durand
                     false,//ettensohn
                     false,//hackney
                     false,//ho
                     false,//hollinger
                     false,//jarvik
                     false,//lanni
                     false, //lee
                     false,//linstedt
                     false,//lopez
                     false,//macbeth
                     false,//mccartney
                     false,//mcmanus
                     true,//minden
                     false,//mitchell
                     true,//murphy
                     false,//puthenveedu
                     true,//rule
                     true,//schwartz
                     true,//urban
                     false,//waggoner
                     false,//woolford
                     };
                     
//Group of Faculty Members who Study Biochemistry, Biophysics, and Structural Biology                                     
boolean [] bioChem = {true, //ahrens
                     false, //barth
                     true, //bruchez
                     false,//durand
                     false,//ettensohn
                     true,//hackney
                     true,//ho
                     false,//hollinger
                     false,//jarvik
                     true,//lanni
                     true, //lee
                     true,//linstedt
                     true,//lopez
                     true,//macbeth
                     false,//mccartney
                     false,//mcmanus
                     true,//minden
                     false,//mitchell
                     false,//murphy
                     true,//puthenveedu
                     true,//rule
                     true,//schwartz
                     false,//urban
                     true,//waggoner
                     true,//woolford
                     };
                     
//Group of Faculty Members who Study Cell Biology                                     
boolean [] cellBio = {false, //ahrens
                     false, //barth
                     true, //bruchez
                     false,//durand
                     true,//ettensohn
                     true,//hackney
                     true,//ho
                     false,//hollinger
                     true,//jarvik
                     true,//lanni
                     true, //lee
                     true,//linstedt
                     true,//lopez
                     false,//macbeth
                     true,//mccartney
                     false,//mcmanus
                     true,//minden
                     true,//mitchell
                     true,//murphy
                     true,//puthenveedu
                     false,//rule
                     false,//schwartz
                     false,//urban
                     true,//waggoner
                     true,//woolford
                     };
                     
//Group of Faculty Members who Study Biotechnology                                    
boolean [] bioTech = {true, //ahrens
                     false, //barth
                     true, //bruchez
                     false,//durand
                     false,//ettensohn
                     false,//hackney
                     true,//ho
                     false,//hollinger
                     true,//jarvik
                     true,//lanni
                     false, //lee
                     false,//linstedt
                     false,//lopez
                     false,//macbeth
                     false,//mccartney
                     false,//mcmanus
                     true,//minden
                     true,//mitchell
                     false,//murphy
                     true,//puthenveedu
                     false,//rule
                     false,//schwartz
                     true,//urban
                     true,//waggoner
                     false,//woolford
                     };
                     
void draw()
{
   prepScreen();
   drawButtons();
   whichFaculty();
   facultyLocations();
   titleAndInstructions();
   checkMouse();
   checkMouseOnFacultyImage();
}

//Determines which Faculty Image to Display
void whichFaculty()
{
  facultyArray[0] = ahrens;
  facultyArray[1] = barth; 
  facultyArray[2] = bruchez; 
  facultyArray[3] = durand; 
  facultyArray[4] = ettensohn; 
  facultyArray[5] = hackney; 
  facultyArray[6] = ho; 
  facultyArray[7] = hollinger; 
  facultyArray[8] = jarvik; 
  facultyArray[9] = lanni; 
  facultyArray[10] = lee; 
  facultyArray[11] = linstedt; 
  facultyArray[12] = lopez; 
  facultyArray[13] = macbeth; 
  facultyArray[14] = mccartney; 
  facultyArray[15] = mcmanus; 
  facultyArray[16] = minden; 
  facultyArray[17] = mitchell; 
  facultyArray[18] = murphy; 
  facultyArray[19] = puthenveedu; 
  facultyArray[20] = rule; 
  facultyArray[21] = schwartz; 
  facultyArray[22] = urban; 
  facultyArray[23] = waggoner; 
  facultyArray[24] = woolford;
}

//Places the Correct Faculty Image and Name at the Correct X & Y Locations
void facultyLocations()
{
 for(int i = 0; i < MAX; i++)
 {
   image(facultyArray[i],xPosition[i],yPosition[i]);
   fill(0);
   text(facultyNames[i],xPosition[i],yPosition[i]+65);
 }
}

//Sets Up the Buttons
void buttonSetUp()
{
  bioChemX = width * .05;
  bioTechX = width * .17;
  cellBioX = width * .29;
  compBioX = width * .41;
  devBioX = width * .53;
  genomicsX = width * .65;
  molBioX = width * .77;
  neuroX = width * .89;
  buttonY = height * .8;
  buttonWidth = width * .05;
  buttonHeight = height * .05;
}

//Draws Buttons with Labels
void drawButtons()
{
  smooth();
  strokeWeight(4);
  stroke(255);
  fill(255,182,193);
  ellipseMode(LEFT);
  ellipse(bioChemX, buttonY, buttonWidth, buttonHeight);
  ellipse(bioTechX, buttonY, buttonWidth, buttonHeight);
  ellipse(cellBioX, buttonY, buttonWidth, buttonHeight);
  ellipse(compBioX, buttonY, buttonWidth, buttonHeight);
  ellipse(devBioX, buttonY, buttonWidth, buttonHeight);
  ellipse(genomicsX, buttonY, buttonWidth, buttonHeight);
  ellipse(molBioX, buttonY, buttonWidth, buttonHeight);
  ellipse(neuroX, buttonY, buttonWidth, buttonHeight);
  fill(255);
  textFont(MyriadProSmall, 11);
  text("Biochemistry,\nBiophysics, & \nStructural \nBiology", bioChemX-15, buttonY + buttonWidth+25);
  text("Biotechnology", bioTechX-15, buttonY + buttonWidth+25);
  text("Cell Biology", cellBioX-15, buttonY + buttonWidth+25);
  text("Computational\nBiology &\nBioinformatics", compBioX-15, buttonY + buttonWidth+25);
  text("Developmental\nBiology", devBioX-15, buttonY + buttonWidth+25);
  text("Genomics,\nProteomics &\nSystems\nBiology", genomicsX-15, buttonY + buttonWidth+25);
  text("Molecular\nBiology &\nGenetics", molBioX-15, buttonY + buttonWidth+25);
  text("Neuroscience", neuroX-15, buttonY + buttonWidth+25);
}

//Generic text to be continually displayed on the screen
void titleAndInstructions()
{
  noStroke();
  fill(255,182,193);
  rect(0,height*.7,width,height*.05);
  fill(139,10,80);
  textFont(MyriadProBold, 20);
  text("Department of Biological Sciences Faculty Research Areas", width*.05, height*.735);
  textFont(MyriadProCond, 13);
  fill(0);
  text("Scroll over the circles to see which faculty members are conducting research in each area.\nClick on a faculty member's photo for more information about their research.", width*.05, height*.05);
}
 
//Check to See What Faculty Members can be listed in each Research Area, when highlights them 
void bioChemCheck()
{
  for(int i = 0; i < MAX; i++)
      {
        if (bioChem[i] == true)
        {
          stroke(139,10,80);
          strokeWeight(7);
          noFill();
          rect(xPosition[i],yPosition[i],50,50);
          noStroke();
          fill(255);
          rect(xPosition[i],yPosition[i]+55,62,12);
          textFont(MyriadProBoldSmall, 11);
          fill(139,10,80);
          text(facultyNames[i],xPosition[i],yPosition[i]+65);
       }
    }
}

void bioTechCheck()
{
  for(int i = 0; i < MAX; i++)
      {
        if (bioTech[i] == true)
        {
          stroke(139,10,80);
          strokeWeight(7);
          noFill();
          rect(xPosition[i],yPosition[i],50,50);
          noStroke();
          fill(255);
          rect(xPosition[i],yPosition[i]+55,62,12);
          textFont(MyriadProBoldSmall, 11);
          fill(139,10,80);
          text(facultyNames[i],xPosition[i],yPosition[i]+65);
       }
    }
}

void cellBioCheck()
{
  for(int i = 0; i < MAX; i++)
      {
        if (cellBio[i] == true)
        {
          stroke(139,10,80);
          strokeWeight(7);
          noFill();
          rect(xPosition[i],yPosition[i],50,50);
          noStroke();
          fill(255);
          rect(xPosition[i],yPosition[i]+55,62,12);
          textFont(MyriadProBoldSmall, 11);
          fill(139,10,80);
          text(facultyNames[i],xPosition[i],yPosition[i]+65);
       }
    }
}

void compBioCheck()
{
  for(int i = 0; i < MAX; i++)
      {
        if (compBio[i] == true)
        {
          stroke(139,10,80);
          strokeWeight(7);
          noFill();
          rect(xPosition[i],yPosition[i],50,50);
          noStroke();
          fill(255);
          rect(xPosition[i],yPosition[i]+55,62,12);
          textFont(MyriadProBoldSmall, 11);
          fill(139,10,80);
          text(facultyNames[i],xPosition[i],yPosition[i]+65);
       }
    }
}

void devBioCheck()
{
  for(int i = 0; i < MAX; i++)
      {
        if (devBio[i] == true)
        {
          stroke(139,10,80);
          strokeWeight(7);
          noFill();
          rect(xPosition[i],yPosition[i],50,50);
          noStroke();
          fill(255);
          rect(xPosition[i],yPosition[i]+55,62,12);
          textFont(MyriadProBoldSmall, 11);
          fill(139,10,80);
          text(facultyNames[i],xPosition[i],yPosition[i]+65);
       }
    }
}

void genomicsCheck()
{
  for(int i = 0; i < MAX; i++)
      {
        if (genomics[i] == true)
        {
          stroke(139,10,80);
          strokeWeight(7);
          noFill();
          rect(xPosition[i],yPosition[i],50,50);
          noStroke();
          fill(255);
          rect(xPosition[i],yPosition[i]+55,62,12);
          textFont(MyriadProBoldSmall, 11);
          fill(139,10,80);
          text(facultyNames[i],xPosition[i],yPosition[i]+65);
        }
    }
}

void molBioCheck()
{
  for(int i = 0; i < MAX; i++)
      {
        if (molBio[i] == true)
        {
          stroke(139,10,80);
          strokeWeight(7);
          noFill();
          rect(xPosition[i],yPosition[i],50,50);
          noStroke();
          fill(255);
          rect(xPosition[i],yPosition[i]+55,62,12);
          textFont(MyriadProBoldSmall, 11);
          fill(139,10,80);
          text(facultyNames[i],xPosition[i],yPosition[i]+65);
        }
    }
}

void neuroCheck()
{
  for(int i = 0; i < MAX; i++)
      {
        if (neuro[i] == true)
        {
          stroke(139,10,80);
          strokeWeight(7);
          noFill();
          rect(xPosition[i],yPosition[i],50,50);
          noStroke();
          fill(255);
          rect(xPosition[i],yPosition[i]+55,62,12);
          textFont(MyriadProBoldSmall, 11);
          fill(139,10,80);
          text(facultyNames[i],xPosition[i],yPosition[i]+65);
        }
    }
}

//Checks if the Mouse is over a Faculty Image and Responses with Correct Faculty Paragraph Depending Upon the Mouse Location
void checkMouseOnFacultyImage()
{
  for(int i = 0; i<MAX; i++)
  {
    if ( mousePressed && mouseX < xPosition[i] + 50 && mouseX > xPosition[i] && mouseY > yPosition[i] && mouseY < yPosition[i]+50)
    {
      if(facultyArray[i] == ahrens)
      {
        fill(0);
        text("Using MRI-based biophysical measurements, the Ahrens laboratory focuses on the elucidation of development\nand pathology of the central nervous system.", width*.05, height*.6);
      }
      else if(facultyArray[i] == barth)
      {
        fill(0);
        text("The Barth group has generated transgenic mice that express fluorescent proteins in response to neural\nactivity, providing a way to image and record from activated neural subsets. The laboratory is using \nthis tool and others to identify specific cortical pathways that are involved in learning and memory.", width*.05, height*.6);
      }
      else if(facultyArray[i] == bruchez)
      {
        fill(0);
        text("The Bruchez Group is studying the balance of protein synthesis, folding, trafficking and degradation\nin axon navigation and synaptic stabilization through the development and use of novel fluorescent technologies \nthat can be applied in whole brain in living animals. ", width*.05, height*.6);
      }
      else if(facultyArray[i] == durand)
      {
        fill(0);
        text("The Durand group works in comparative genomics, focusing on the evolution of genome organization and\n functional diversity.", width*.05, height*.6);
      }
      else if(facultyArray[i] == ettensohn)
      {
        fill(0);
        text("The Ettensohn laboratory studies complex gene regulatory networks that underlie embryonic development\nand uses gene knockdown techniques to dissect the developmental functions of genes.", width*.05, height*.6);
      }
      else if(facultyArray[i] == hackney)
      {
        fill(0);
        text("Research focuses on the investigation of the biochemical and biophysical properties of biological molecular\nmotors, both in free solution and at the single molecule level. This includes studies of the mechanism\nand regulation of kinesin superfamily members, helicases and other ATPases.", width*.05, height*.6);
      }
      else if(facultyArray[i] == ho)
      {
        fill(0);
        text("Using rodent models for organ transplantation, the Ho laboratory studies the migration and accumulation of \nimmune cells within rejecting kidney, heart, and lung tissues. Non-invasive MRI methods are used to analyze \ncellular behavior.", width*.05, height*.6);
      }
      else if(facultyArray[i] == hollinger)
      {
        fill(0);
        text("The Hollinger group investigates molecular and cellular mechanisms in bone regeneration, with particular \nemphasis on clinical therapies.", width*.05, height*.6);
      }
       else if(facultyArray[i] == jarvik)
      {
        fill(0);
        text("The Jarvik laboratory is developing high throughput methods for trapping genes and observing reporter-tagged \ngene products in mammalian cells.", width*.05, height*.6);
      }
      else if(facultyArray[i] == lanni)
      {
        fill(0);
        text("Regulation of mechanical activity in the actin-based cytoskeleton is a major interest area in the Lanni laboratory.", width*.05, height*.6);
      }
      else if(facultyArray[i] == lee)
      {
        fill(0);
        text("Research in the Lee lab focuses on the structure and function relationship of the mammalian endoplasmic reticulum. \nWe apply biochemical and imaging approaches to investigate this question in cultured cells.", width*.05, height*.6);
      }
      else if(facultyArray[i] == linstedt)
      {
        fill(0);
        text("The Linstedt group is investigating molecular mechanisms that establish and maintain the membrane-bounded \ncompartments of the secretory and endocytic pathways. Approaches include permeabilized cell assays, biochemical \nreconstitutions, cell imaging techniques and molecular genetic experiments.", width*.05, height*.6);
      }
      else if(facultyArray[i] == lopez)
      {
        fill(0);
        text("The López laboratory uses various model systems to study how splicing of pre-mRNA is regulated in vivo and \nhow alternative splicing influences development and cellular function. Recursive splicing mechanisms and their \nrole in expression of very large transcription units are major areas of study.", width*.05, height*.6);
      }
      else if(facultyArray[i] == macbeth)
      {
        fill(0);
        text("The Macbeth lab is interested in RNA-protein interactions, specifically those that involve ADARs, or Adenosine \ndeaminases that act on RNA. We use structural, biochemical and genetic methods to characterize the 3-D ADAR \nstructure, its enzymatic mechanism, and the regulation of its activity.", width*.05, height*.6);
      }
      else if(facultyArray[i] == mccartney)
      {
        fill(0);
        text("Research in the McCartney laboratory is aimed at elucidating the relationship between Wnt/Wingless signal \ntransduction and cytoskeletal organization in Drosophila development using the APC family of tumor suppressors \nas a model.", width*.05, height*.6);
      }
      else if(facultyArray[i] == mcmanus)
      {
        fill(0);
        text("Gene expression varies between individuals and species, and this variation is largely responsible for phenotypic \ndiversity and disease. Research in the McManus lab focuses on understanding the genetic causes of \nvariation in gene expression.", width*.05, height*.6);
      }
      else if(facultyArray[i] == minden)
      {
        fill(0);
        text("The Minden laboratory is using proteomics and time-lapse microscopy to study how cells change shape during \nDrosophila embryogenesis. They are also using the same methods to study early protein changes during \ndevelopmentally regulated cell death.", width*.05, height*.6);
      }
      else if(facultyArray[i] == mitchell)
      {
        fill(0);
        text("The Mitchell laboratory applies new gene disruption and overexpression strategies to identify C. albicans \ngenes that govern pathogenesis and to understand their functional relationships, and to understand the \nmechanistic relationships in a fungal endosome-associated signal transduction pathway.", width*.05, height*.6);
      }
      else if(facultyArray[i] == murphy)
      {
        fill(0);
        text("Computational cell biology projects in the Murphy laboratory include using computational approaches to analyze \nthe patterns of proteins in fluorescence microscope images to create self-populating knowledge bases \nand models of protein subcellular location.", width*.05, height*.6);
      }
      else if(facultyArray[i] == puthenveedu)
      {
        fill(0);
        text("The Puthenveedu laboratory studies how membrane trafficking regulates receptor-mediated signaling in living cells. \nWe focus on trafficking events that regulate signaling by G protein-coupled receptors involved in drug addiction.", width*.05, height*.6);
      }
      else if(facultyArray[i] == rule)
      {
        fill(0);
        text("NMR methods are being used to investigate the role of protein dynamics in enzymatic function. Current systems \nunder study in the Rule laboratory include cellular detoxification enzymes (glutathione transferases) and Eco RV \nendonuclease. In addition, the enzymatic mechanism of glutathione transferases is being investigated using \nsite-directed mutagenesis, NMR spectroscopy, and X-ray diffraction.", width*.05, height*.6);
      }
      else if(facultyArray[i] == schwartz)
      {
        fill(0);
        text("The Schwartz lab works on many topics in modeling, simulation, and optimization in biology. One major focus is \nthe development and use of stochastic simulations to study macromolecular assembly systems. Another focus is \nphylogenetics, with specific interests in the analysis of intraspecies genetic variation data and the evolution of \ntumor cells in cancers.", width*.05, height*.6);
      }
      else if(facultyArray[i] == urban)
      {
        fill(0);
        text("Currently, work in the Urban lab focuses on understanding the physiological mechanisms underlying the functional \nand computational properties of brain neuronal networks, focusing on the olfactory system. In particular, we are \ninterested in measuring the detailed anatomical and physiological properties of cells and synapses and then constructing \nmodels that provide insight into how these physiological properties give rise to circuits that transform and store \ninformation in the brain.", width*.05, height*.6);
      }
      else if(facultyArray[i] == waggoner)
      {
        fill(0);
        text("Research has focused on the development of fluorescence-based detection systems for biology and biotechnology. Our \ncurrent focus applies the Fluorogen-Activating Protein (FAP) technology to develop novel biosensors of protein \ninteractions and pathway regulation within living cells.", width*.05, height*.6);
      }
      else if(facultyArray[i] == woolford)
      {
        fill(0);
        text("Having developed methods to purify ribosome assembly intermediates, the Woolford laboratory is now mapping \nribonucleoprotein neighborhoods within assembling ribosomes. We have developed assays to identify protein-protein \nas well as protein_RNA contacts within assembling ribosomes. Based on structure predictions, mutations are being \nconstructed to disrupt these interactions, to evaluate their importance in ribosome assembly and function.", width*.05, height*.6);
      }
    }
  }
}

//Check where the Mouse is over the Buttons, then Proceeds with the Correct Response with Each Button
void checkMouse()
{
  if ( mouseX < bioChemX + buttonWidth && mouseX > bioChemX && mouseY > buttonY && mouseY < buttonY + buttonHeight)
  {
    bioChemCheck();
  }
  else if ( mouseX < bioTechX + buttonWidth && mouseX > bioTechX && mouseY > buttonY && mouseY < buttonY + buttonHeight)
  {
    bioTechCheck();
  }
  else if ( mouseX < cellBioX + buttonWidth && mouseX > cellBioX && mouseY > buttonY && mouseY < buttonY + buttonHeight)
  {
    cellBioCheck();
  }
  else if ( mouseX < compBioX + buttonWidth && mouseX > compBioX && mouseY > buttonY && mouseY < buttonY + buttonHeight)
  {
    compBioCheck();
  }
  else if ( mouseX < devBioX + buttonWidth && mouseX > devBioX && mouseY > buttonY && mouseY < buttonY + buttonHeight)
  {
    devBioCheck();
  }
  else if ( mouseX < genomicsX + buttonWidth && mouseX > genomicsX && mouseY > buttonY && mouseY < buttonY + buttonHeight)
  {
    genomicsCheck();
  }
  else if ( mouseX < molBioX + buttonWidth && mouseX > molBioX && mouseY > buttonY && mouseY < buttonY + buttonHeight)
  {
    molBioCheck();
  }
  else if ( mouseX < neuroX + buttonWidth && mouseX > neuroX && mouseY > buttonY && mouseY < buttonY + buttonHeight)
  {
    neuroCheck();
  }
}

//Basic Set Up for the Screen
void prepScreen()
{
  background(255);
  fill(139,10,80);
  rect(0,height*.75,width,height*.25);
}

