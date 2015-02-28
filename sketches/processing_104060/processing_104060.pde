
import processing.net.*;

public class LightComm {
  Server server;
  Client client;
  boolean isServer;
  int packSent, packReceived;
  
  public LightComm(PApplet applet, boolean isServer,
      String ip, int port)
  {
    this.isServer = isServer;
    if(isServer) {
      server = new Server(applet, port);
    }
    else {
      client = new Client(applet, ip, port);
    }
  }
  
  public Client available()
  {
    if(isServer) {
      return server.available();
    }
    else {
      if(client.available() > 5) {
        return client;
      }
      else return null;
    }
  }
  
  public ArrayList<LightData> readData()
  {
    ArrayList<LightData> datas = new ArrayList<LightData>();
    Client readFrom = null;
    while((readFrom = available()) != null) {
      byte index = (byte) readFrom.read();
      String string = null;
      do {
        string = readFrom.readStringUntil('\n');
        try {
          Thread.sleep(5);
        }
        catch(InterruptedException exc) {}
      } while(string == null);
      String[] parts = string.trim().split("\\s");
      float dx = Float.parseFloat(parts[0]);
      float dy = Float.parseFloat(parts[1]);
      datas.add(new LightData(dx, dy, index));
      packReceived++;
    }
    return datas;
  }
  
  public void writeData(LightData data)
  {
    String string = data.dx + " " + data.dy + "\n";
    if(isServer) {
      server.write(data.index);
      server.write(string);
    }
    else {
      client.write(data.index);
      client.write(string);
    }
    packSent++;
  }
  
  public int packSent()
  {
    return packSent;
  }
  
  public int packReceived()
  {
    return packReceived;
  }
}
