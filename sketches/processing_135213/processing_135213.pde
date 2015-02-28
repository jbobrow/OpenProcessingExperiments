
/**
 * based on...
 * CachedDataLoadQueue taken from http://processinghacks.com/hacks:dataloadqueue
 * @author toxi
 */

class ImageUploader extends Thread {
  private ImageUploaderCallback caller;
  private PApplet app;
  private PImage[] images;

  private boolean isAlive = true;

  public int sleepTime = 30;

  String baseURL = "http://impression5.org/lightpainting/";
  String url = baseURL + "glowdoodle_uploader.php";

  public ImageUploader(PApplet app, PImage[] images) {
    this.app=app;
    this.images=images;
  }

  public void setCallback(ImageUploaderCallback cb) {
    caller=cb;
    if (caller==null) isAlive=false;
  }

  // some web APIs require a minimum delay between requests from the same IP
  // you can set this duration here (in milliseconds)...
  public void setSleepTime(int delay) {
    sleepTime=delay;
  }

  // main thread loop, triggered by the start() method
  public void run() {
    String filename = createFilename();
    //postData(filename, "jpg", "images", bufferImage(images[0]), true);
   // postData(filename, "jpg", "thumbs", bufferImage(images[1]), true);
    caller.queueComplete();
  }

  String createFilename() {
    return "glowdoodle-" + str(year()) + "-" + str(month()) + "-" + str(day()) + "-" + str(hour()) + "-" + str(minute()) + "-" + str(second());
  }

  private void postData(String title, String ext, String folder,  byte[] bytes, boolean popup)
  {
    try{
      URL u = new URL(url+"?title="+title+"&ext="+ext+"&folder="+folder);
      URLConnection c = u.openConnection();
      // post multipart data 
      c.setDoOutput(true);
      c.setDoInput(true);
      c.setUseCaches(false); 
      // set request headers
      c.setRequestProperty("Content-Type", "multipart/form-data; boundary=AXi93A");
      // open a stream which can write to the url
      DataOutputStream dstream = new DataOutputStream(c.getOutputStream());
      // write content to the server, begin with the tag that says a content element is comming
      dstream.writeBytes("--AXi93A\r\n");
      // discribe the content
      dstream.writeBytes("Content-Disposition: form-data; name=\"data\"; filename=\"a \r\nContent-Type: image/jpeg\r\nContent-Transfer-Encoding: binary\r\n\r\n");
      dstream.write(bytes,0,bytes.length);
      // close the multipart form request
      dstream.writeBytes("\r\n--AXi93A--\r\n\r\n");
      dstream.flush();
      dstream.close();

      // read the output from the URL
      try{
        BufferedReader in = new BufferedReader(new InputStreamReader(c.getInputStream()));
        String sIn = in.readLine();
        boolean b = true;
        while(sIn!=null){
          if(sIn!=null){
            System.out.println(sIn);
            if (sIn.equals("success")) {
              println("looks like it worked");
            }
          }
          sIn = in.readLine();
        }
      }
      catch(Exception e){
        //e.printStackTrace();
        println("failed at server");
        caller.itemFailed();
      }
    }
    catch(Exception e){
      //e.printStackTrace();
      println("failed to upload");
      caller.itemFailed();
      
    }
  }

/*
  private byte[] bufferImage(PImage srcimg){
    ByteArrayOutputStream out = new ByteArrayOutputStream();
    //BufferedImage img = new BufferedImage(srcimg.width, srcimg.height, BufferedImage.TYPE_INT_RGB);
    loadPixels();
    //img.setRGB(0, 0, srcimg.width, srcimg.height, srcimg.pixels, 0, srcimg.width);

    //try{
     // JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
      //JPEGEncodeParam encpar = encoder.getDefaultJPEGEncodeParam(img);
      //encpar.setQuality(1,false);
      //encoder.setJPEGEncodeParam(encpar);
      //encoder.encode(img);
    //}
   // catch(FileNotFoundException e){
      //System.out.println(e);
    //}
    //catch(IOException ioe){
      //System.out.println(ioe);
    //}
    //return out.toByteArray();
  }
*/

}



