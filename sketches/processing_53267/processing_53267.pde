
class AltConThread extends Thread{
  //Local reference to events.
  ArrayList events;
  ArrayList commands;
  
  //ID.
  int id;
  
  //Private connection.
  Socket ours;
  
  //Thread object.
  Thread t;
  
  //Boolean representing that the message has been read.
  boolean readMessage;
  
  //Yeah.
  boolean stop;
  
  //The thread will run for 5 minutes before timing out.
  int startMilli;
  
  //Tributaries.
  OutputStream out;
  InputStream in;
  
  //The incoming raw message.
  String message;
  char[] usedBytes;
  
  //Boolean representing if we have a message.
  boolean hasMessage;
  
  //For more readable logs.
  String[] bankNames;
  String curBank;
  //For loading the names of the patterns for the same reason...
  String[] patNames;
  String curPat;
  //Also the preset names.
  String[] presNames;
  //And why not the channels?
  String[] chanNames;
  String curChan;
  //AND EVEN general regions, because it exists.
  String[] placeNames;
  String curPlace;
  
  public AltConThread(Socket sock, int ID,  ArrayList Hapnins, ArrayList doins, String[] bankNames, String[] patNames, String[] presNames, String[] chanNames, String[] placeNames){
    super("Goon thread #"+ID);
    ours = sock;
    id = ID;
    events = Hapnins;
    commands = doins;
    hasMessage = false;
    readMessage = false;
    stop = false;
    
    this.bankNames = bankNames;
    this.patNames = patNames;
    this.presNames = presNames;
    this.chanNames = chanNames;
    this.placeNames = placeNames;
    usedBytes = new char[9];
  }
  
  //Begin the goon's thread.
  public void begin(){
    startMilli = millis();
    start();
  }
  
  //End the goon's thread. On purpose. Like a dick.
  public void end(){
    stop = true;
  }
  
  //Returns whether or not this thread is alive.
  public boolean alive(){
    try{
      return t.isAlive();
    }
    catch(Exception e){
      return true;
    }
  }
  
  //Returns true if the thread has a message.
  public boolean hasMessage(){
    return hasMessage;
  }
  
  //Gets the message.
  public char[] getMessage(){
    return usedBytes;
  }
  
  //Add this goon's event to events.
  public void addToEvents(ArrayList hapnins, char[] bytes){
    String intMessage = "";
    for(int i = 0; i<bytes.length; i++){
      intMessage+=(int)bytes[i]+"-";
    }
    println(intMessage);
    //Set curPlace to the place the command refers to.
    curPlace = placeNames[(byte) bytes[1]/2];
    
    //Set curBank to the bank the command refers to.
    curBank = bankNames[(byte) bytes[1]];
    
    //Ser curChan to the channel the command refers to.
    curChan = chanNames[(byte) bytes[2]];
    
    //The current pattern is rather tricky. If we are using the 
    //third channel the user selected a preset, so we need to get the 
    //so-called pattern name from the presets' name bank.
    if((byte)bytes[2]== 3){
      curPat = presNames[(byte)bytes[3]];
    } 
    //Otherwise, just grab curPat from the pattern name bank.
    else{
      curPat = patNames[(byte)bytes[3]];
    }
    
    //Load in the parameter values.
    int p1 = bytes[4], p2 = bytes[5], p3 = bytes[6], p4 = bytes[7];
    
    String toAdd = String.format("%-6s|%-12s|%-12s|%-20s|%-25s|%-25s|%-8s|%-12s|%-10s|%-10s|%-10s|%-10s", 
                          id, day()+"-"+month()+"-"+year(), hour()+":"+minute()+":"+second()+"."+(millis()%1000), 
                           intMessage, curPlace, curBank, curChan, curPat, p1, p2, p3, p4);
    events.add(toAdd);
    System.out.println(toAdd);
  }
  
  public void run(){
    //Get IO streams.
    try{
      out = ours.getOutputStream();
      in = ours.getInputStream();
    } 
    catch(IOException e){
      System.out.println("GOON#"+id+": Could not create IO streams.");
      events.add("AltConThread #"+id+": could not create IO streams.");
    }
    
    //Get thread object.
    t = Thread.currentThread();
    
    //Read in the message when it arrives.
    try{
      while(!readMessage){
        if(millis()-startMilli > 300000){
          System.out.println("Goon#"+id+" has timed out.");
          events.add(" ***Goon#"+id+" has timed out.");
          return;
        }

        if(in.available()>8){
          for(int i = 0; i < usedBytes.length; i++){
            usedBytes[i] = (char)in.read();
          }
          readMessage = true;
          System.out.println("GOON#"+id+": Message read.");
          hasMessage = true;
          //Create the string version of the message.
          String intMessage = "";
          for(int i = 0; i < usedBytes.length; i++){
            intMessage+=(byte)usedBytes[i]+"-";
          }
          System.out.println("GOON#"+id+": Message has been recieved and processed.");
          
          addToEvents(events, usedBytes);
          commands.add(usedBytes);
          
          //Churn through extra bytes.
          while(in.available() > 0){
            in.read();
          }
          System.out.println(" ***Goon#"+id+" has finished.");
          events.add(" ***Goon#"+id+" has finished.");
          return;
        }
      }
    }
    catch(IOException e){
      System.out.println("GOON#"+id+": IO error.");
    }
    finally{
      //super.stop();
    }
  }
}
      
      
      
      
    
    

