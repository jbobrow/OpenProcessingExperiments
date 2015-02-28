
//cc. non commercial share alike Tom Schofield 2011

//ANALYSIS CLASS CARRIES OUT DIFFERENT ANALYSES AND ASSIGNS THEIR RESULTS TO A SPECIFIED PARTICLE SYSTEM
class Analysis {
  String delimiters = " ,.?!;\\\":[]()-";
  //one kind of analysis - more to be implemented later
  Tfidf[] tfidf;
  Tfidf oneTfidf;
  int[] nums;
  float[][] attractionForces;
  String[] fileNames;
  String[][]significantWords;
   String[][] allSignifWords;
  String[][]lines;
  //all words for the corpus
  String[][] allWords;

  // Particle(float x, float y, int num, float[]att, int ind, String name, String[]sw, String[] lns, int SYS_S) {
  // Constructor
  Analysis() {
  }
  
  ////////////////******************main analysis *********************************////////////////

  void runTfidfComparison(String corpusFolder, String docFolder, int NUM_OF_DOCS, int NUM_OF_COMPARISON_WORDS, int ind) {

    println("stripping corpus");
    allWords=stripCorpus(corpusFolder);

    //holds all significant words for each document to compare them
   
    println("allWords "+allWords);
    //these are the names of the docs for the map NOT the corpus
    ArrayList names= new ArrayList();
    File dir = new File(dataPath(docFolder+"/"));
    String[] children = dir.list();
    if (children == null) {
      //  println("not there");
      // Either dir does not exist or is not a directory
    } 
    else {
      for (int i=0; i<children.length; i++) {
        String temp[]=splitTokens(children[i],".");
        try {
          if(temp[1].equals("txt")) {
            names.add(temp[0]);
          }
        }
        catch(Exception e) {
        }
      }
    } 

    // println(names.size());
    //names.size()

    tfidf =new Tfidf[NUM_OF_DOCS];

    for(int i=0;i<NUM_OF_DOCS;i++) {

      //for each text file in the folder make a unique tfidf object
      String thisName=docFolder+"/"+names.get(i)+".txt";
      tfidf[i]=new Tfidf(thisName, NUM_OF_COMPARISON_WORDS);
    }

    allSignifWords=new String[tfidf.length][];
    significantWords=new String[tfidf.length][];
    for(int i=0;i<tfidf.length;i++) {
      tfidf[i].thisIndex=i;
      tfidf[i].loadFile();
      tfidf[i].stripFormatting();
      tfidf[i].makeStringsUnique();
      tfidf[i].countWordFreq();
    }



    for(int i=0;i<tfidf.length;i++) {


      //here we pass in the corpus for comparison as 2D array
      tfidf[i].calculateTfidf(allWords);
    }
    for(int i=0;i<tfidf.length;i++) {
      tfidf[i].orderByTfidf();
     
      allSignifWords[i]=tfidf[i].signifWords;
      significantWords[i]=tfidf[i].signifWords;
       println("allSignifWords[0][0] "+allSignifWords[i][0]);  
  }
    for(int i=0;i<tfidf.length;i++) {
      tfidf[i].compareDocs(allSignifWords);
    }


    getValuesForParticles(NUM_OF_DOCS);
  }
////////////////******************do analysis for just one doc (is called on dropped particle via map class) *********************************////////////////

  void runTfidfComparisonOnce(String droppedPath, String corpusFolder, String docFolder, int NUM_OF_DOCS, int NUM_OF_COMPARISON_WORDS, int ind) {

    println("allWords "+allWords);

    println("droppedPath "+droppedPath);
    //get the file name only of the
    String[] explodedFilePath=splitTokens(droppedPath, "/");
    String[] explodedFileName=splitTokens(explodedFilePath[explodedFilePath.length-1], ".");
    
    //for(int i=0;i<explodedFileName.length-1
    
    String rippedPdfFileName="dropped/"+explodedFileName[explodedFileName.length-2]+".txt";
    println("rippedPdfFileName "+rippedPdfFileName);
    oneTfidf =new Tfidf(rippedPdfFileName,NUM_OF_COMPARISON_WORDS );
    
   println("made object");

   // allSignifWords=new String[tfidf.length][];
    
      oneTfidf.thisIndex=NUM_OF_DOCS;
      oneTfidf.loadFile();
      println("loaded file");
      oneTfidf.stripFormatting();
      println("stripped formatting");
      oneTfidf.makeStringsUnique();
      println("made strings unique");
      oneTfidf.countWordFreq();
      println("counted words");
   



    //for(int i=0;i<tfidf.length;i++) {


      //here we pass in the corpus for comparison as 2D array
     oneTfidf.calculateTfidf(allWords);
    //}
    //for(int i=0;i<tfidf.length;i++) {
      oneTfidf.orderByTfidf();
     
     //change to add to the array
     println("allSignifWords.length "+allSignifWords.length);
     allSignifWords=(String[][]) append(allSignifWords, oneTfidf.signifWords);
    //  allSignifWords[i]=oneTfidf.signifWords;
    //}
   // for(int i=0;i<tfidf.length;i++) {
     
     //this has compared the attraction of this to others but not their attraction to me
     
     //compare docs sets the number of significant words and the num of other docs
     
     
     oneTfidf.compareDocs(allSignifWords);
   // }
   println("oneTfidf.NUM_DOCS is "+oneTfidf.NUM_OF_DOCS);//+" oneTfidf.NUM_DOCS is "+ tfidf[0].NUM_OF_DOCS);
     

   // getValuesForParticles(NUM_OF_DOCS);
  }
float[] getAttractions(float[] myForces){
  //float[] newAttractions
 return myForces;
}
////////////////******************append new forces and signif word to main arrayts *********************************////////////////

void updateForcesAndSigWordsForAll(float[] addedForces, String[] addedSigWords){

}

////////////////******************rips all corpus docs of punnctualtion and re-stores them in rippedCorpus subdirector *********************************////////////////
  String [][] stripCorpus(String corpusFolder) {

    makeRippedDirectory(corpusFolder);

    //an array list to hold corpus text file names
    ArrayList names= new ArrayList();
    File dir = new File(dataPath(corpusFolder+"/"));

    String[] children = dir.list();
    if (children == null) {
      //  println("not there");
      // Either dir does not exist or is not a directory
    } 
    else {
      for (int i=0; i<children.length; i++) {
        String temp[]=splitTokens(children[i],".");
        try {
          if(temp[1].equals("txt")) {
            String myFileName=temp[0]+".txt";
            // println("myFileName "+myFileName);
            names.add( myFileName);
          }
        }
        catch(Exception e) {
        }
      }
    } 


    //declare a 2D array, first dimension is the each document, second dimension is each word for each document
    String[][] sCorpus=new String[names.size()][];

    for(int i=0;i<sCorpus.length;i++) {

      String[] strippedExploded;
      String stripped="";
      //for each document in the corpus
      println("(String)names.get(i) "+(String)names.get(i));
      String[] lines=loadStrings(corpusFolder+"/"+(String)names.get(i));
      for(int k=0;k<lines.length;k++) {
        lines[k]=lines[k].replaceAll("[^A-Za-z]", " ");

        String[] oneLine=splitTokens(lines[k],delimiters);

        for(int j=0;j<oneLine.length;j++) {

          //eliminate excess white space and make lowercase then put back in a line seperated only by spaces
          String currentString =trim(oneLine[j].toLowerCase());
          try {
            String[] pos= wordnet.getPos(currentString);
            for(int m=0;m<pos.length;m++) {
              if(pos[m].equals("a")||pos[m].equals("n")||pos[m].equals("r")||pos[m].equals("v")) {
                //  println("Current String "+currentString+" "+pos[k]);
                stripped+=" "+currentString;
              }
            }
          }
          catch(Exception e) {
          }
        }
      }

      strippedExploded=splitTokens(stripped," ");
      sCorpus[i]=strippedExploded;


      PrintWriter strippedSaver;
      strippedSaver=createWriter("data/"+corpusFolder+"/rippedCorpus/"+(String)names.get(i));
      //strippedSaver=createWriter("data/new");
      println("printintg file "+corpusFolder+"/rippedCorpus/"+(String)names.get(i));
      // println(sCorpus[i]);
      for(int m=0;m<strippedExploded.length;m++) {
        strippedSaver.println(strippedExploded[m]);
      }
      strippedSaver.flush();
      strippedSaver.close();
    }
    return sCorpus;
  }

  void getValuesForParticles(int NUM_DOCS) {

    //copy the tfidf info over so we can pass into the particles later 
    // 
    attractionForces=new float[NUM_DOCS][];
    fileNames=new String[NUM_DOCS];
    //significantWords=new String[NUM_DOCS][];
    //significantWords=new String[NUM_DOCS][];
    lines=new String[NUM_DOCS][];
    println("tfidf[i].attractionForces "+tfidf[0].attractionForces[0]);
    for(int i=0;i<NUM_DOCS;i++) {  
      attractionForces[i]=tfidf[i].attractionForces;
      fileNames[i]=tfidf[i].fileName;
      //significantWords[i]=tfidf[i].signifWords;
      allSignifWords[i]=tfidf[i].signifWords;
      lines[i]=tfidf[i].lines;
    }
  }

   ////////////////////////////SAVES THE ORIGINAL DOCUMENTS AS TXT FILES SO WE CAN RE-EXAMINE LATER WITHOUT RIPPING THE PDFS AGAIN////////////
  void makeRippedDirectory(String corpusFolder) {
    try
    {
      //runtime is the java interface to other process
      Runtime rt = Runtime.getRuntime();

      //execute a terminal command - the terminal command calls a jar which can rip pdfs - this needs to be changed to use the actual java file
      /// mkdir /Users/tom/Desktop/PDFBOX "new1"

      // "mkdir " +dataPath("")+corpusFolder+"/rippedCorpus/"
      // Process pr = rt.exec("java -cp /Users/tom/Documents/Processing/loadPDF/data/pdfbox-app-1.4.0.jar org.apache.pdfbox.ExtractText /Users/tom/Documents/Processing/loadPDF/data/"+filenames[i]+" /Users/tom/Documents/Processing/loadPDF/data/txtPapers/"+filenames[i]+".txt");
      Process pr = rt.exec("mkdir " +dataPath("")+corpusFolder+"/rippedCorpus/");
      //wait till process is finished before you do anything else
      int exitVal = pr.waitFor();

      println("Exited with error code "+exitVal);
    }
    catch (Exception e)
    {
      println(e.toString());
      e.printStackTrace();
    }
  }

  //called when loading from log file ins - populates the allWords array which is need to compare documents
  void getAllWordsFromFile(String corpusFolder) {
    File dir = new File(dataPath(corpusFolder+"/rippedCorpus"));
    String[] children = dir.list();
    ArrayList names= new ArrayList();
    if (children == null) {
      //  println("not there");
      // Either dir does not exist or is not a directory
    } 
    else {
      for (int i=0; i<children.length; i++) {
        String temp[]=splitTokens(children[i],".");
        try {
          if(temp[1].equals("txt")) {
            names.add(temp[0]);
          }
        }
        catch(Exception e) {
        }
      }
    } 
    allWords=new String[names.size()][];
    for(int i=0;i<names.size();i++) {
      allWords[i]=loadStrings(corpusFolder+"/rippedCorpus/"+(String)names.get(i)+".txt");
     // println(allWords[i]);
      
    }
    /////String[] lines=loadStrings(corpusFolder+"/rippedCorpus/"+(String)names.get(i));
  }
  void getWordsAndForcesFromLog(String[][] sW, float[][] frcs){
    allSignifWords=sW;
    attractionForces=frcs;
  }
}


