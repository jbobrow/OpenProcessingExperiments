

import java.io.InputStreamReader;

String ip = "192.168.1.1";
int f_width = 600;
int f_height = 150;
int strip_w = 1;
int strip_h =150;
String respTime = "";
int tickerx=0;
int tickery =0;
boolean pingUpdated =false;

void setup(){
 size(f_width,f_height);
 noStroke();fill(200);
 rect(0,0,f_width,f_height);
 Ping ping = new Ping(ip);
 ping.start(); // start the thread 
 
}


void draw(){     
  if (pingUpdated) {println(respTime);drawResults(respTime);  } 
}




void drawResults (String s)
{
  int num=-1;
   try{
   num = Integer.parseInt(s);
  }
 catch (Exception e) {
            System.out.println(e);
        } 
 if (num >0) fill(min(255,num), 255-min(255,num),75,200);
  else fill(255,255,255);
  rectMode(CORNER);
  noStroke();
  pushMatrix();
  rect(tickerx,tickery,strip_w,strip_h);
  popMatrix();
  tickerx+=strip_w;
  if(tickerx % width == 0) {tickerx=0; tickery+=strip_h;}
  if(tickery == height){tickerx=0;tickery=0;noStroke();fill(200);
 rect(0,0,f_width,f_height);}        

}


public class Ping extends Thread{
  
  String target;
  boolean running;

  
   public Ping(String t) {
    target = t;
    }
  public void start() {
        super.start();
        running = true;
    }  
    
public void run(){
 String pingCmd = "ping -t " + target;
        try {
            Runtime r = Runtime.getRuntime();
            Process p = r.exec(pingCmd);
            BufferedReader in = new BufferedReader(new
            InputStreamReader(p.getInputStream()));
            String inputLine;
            while ((inputLine = in.readLine()) != null) {            
              pingUpdated = false;  
              String pingResult = respTime;
              System.out.println(inputLine);
               int p1 = inputLine.indexOf("time=")+5;
                if (p1<6) p1 = inputLine.indexOf("time<")+5;
                  int p2 = inputLine.indexOf("ms");
                    if(p1<p2&&p1>0){respTime = inputLine.substring(p1,p2);}
                    if(!pingResult.equals(respTime)) pingUpdated = true;
            }
            in.close();

        } catch (IOException e) {
            //System.out.println(e);
        } 

}
}

