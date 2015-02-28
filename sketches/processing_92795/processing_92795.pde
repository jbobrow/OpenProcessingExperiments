
import processing.video.*;
import javax.imageio.*;//lib for compressing image for flickrj api kit
import java.awt.image.*;
import com.aetrion.flickr.*;//lib of flickrj api kit

String apiKey = "6eebef2f7990e7f7348795409c2f4bc8";
String secretKey = "24115f058023a1b4";

Flickr flickr;
Uploader uploader;
PhotosetsInterface photosetsInterface;
Auth auth;
String frob = "";
String token = "";//flickrj api kit

Capture cam;
PImage myphoto,yourphoto,ourphoto;
String myphotoid="";
String ourphotoid="";
String private_set = "72157631964550211";//flickr private photo set/album id
String public_set =  "72157631968425124";//flickr public photo set/album id
boolean captured=false;
boolean ourphoto_uploaded=false;

void setup() {
  size(640, 480);
  myphoto = createImage(width, height, RGB);
  String[] cameras = Capture.list();
  
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } 
  else {
   // println("Available cameras:");
   // for (int i = 0; i < cameras.length; i++) {
   //   println(cameras[i]);
   // }
    
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, cameras[0]);
    cam.start();
    println("Camera started. Press C to capture.");
    
    flickr = new Flickr(apiKey, secretKey, (new Flickr(apiKey)).getTransport());
    authenticate();
    uploader = flickr.getUploader();
    photosetsInterface = flickr.getPhotosetsInterface();
  }      
}

void draw() {
  if (captured==false){
        if (cam.available() == true) {
            cam.read();
            }
        else {
            image(cam, 0, 0);
        }
  }
  else
  { //key pressed, camera stop, blend image, show blended photo
    background(myphoto);
    blend(yourphoto,0,0,640,480,0,0,640,480,SCREEN);
    if (ourphoto_uploaded==false)
      {  ourphoto=get();
         upload(ourphoto,ourphotoid,public_set);
         ourphoto_uploaded=true;
         println("Press D to continue.");
      }
  }
  
  // The following does the same, and is faster when just drawing the image
  // without any additional resizing, transformations, or tint.
  //set(0, 0, cam);
}

void keyPressed() {
    if (key == 'c' || key == 'C'){
      myphoto = get();//capture

      upload(myphoto,myphotoid,private_set);

      //get lastest private photo
      String getphoto_query = "http://api.flickr.com/services/rest/?method=flickr.photosets.getPhotos&api_key=6eebef2f7990e7f7348795409c2f4bc8&photoset;_id=" + private_set;
      XML xml = loadXML(getphoto_query);
//      println(xml);
      XML[] photo = xml.getChildren("photoset/photo");
      int last_photo = photo.length-2;
      String farm = photo[last_photo].getString("farm");
      String server = photo[last_photo].getString("server");
      String id = photo[last_photo].getString("id");
      String secret = photo[last_photo].getString("secret");
      String img = "http://farm"+farm+".staticflickr.com/"+server+"/"+id+"_"+secret+".jpg";
      
      yourphoto = loadImage(img); // save to yourphoto
      captured=true;
       
    }
    
    if (key == 'd' || key == 'D'){
           captured=false;
           ourphoto_uploaded=false;
           myphotoid="";
           ourphotoid="";
    }
}

void upload(PImage photo_to_upload, String photoid, String photo_set) { // upload photo and get photo id || add photo to a photo set

      byte[] compressedImage = compressImage(photo_to_upload);
      UploadMetaData uploadMetaData = new UploadMetaData(); 
      uploadMetaData.setTitle("Image " + frameCount + " from Processing"); 
      uploadMetaData.setDescription("");   
      uploadMetaData.setPublicFlag(true);
      try {
        photoid=uploader.upload(compressedImage, uploadMetaData);
          }
      catch (Exception e) {
      println("Upload failed");
        }
      if (photoid==myphotoid)  
      println("Finished uploading my photo");  //upload photo
      if (photoid==ourphotoid)
      println("Finished uploading our photo");
      
      try {               //add uploaded photo to a set
         photosetsInterface.addPhoto(photo_set,photoid);
      }
      catch (Exception e) {
      println("Get photoset interface failed");
      return;
      }     
}


///////////////////////////////////////////////////////////////////////
// Attempts to authenticate. Note this approach is bad form,
// it uses side effects, etc.
void authenticate() {
  // Do we already have a token?
  if (fileExists("token.txt")) {
    token = loadToken();    
 //   println("Using saved token " + token);
    authenticateWithToken(token);
  }
  else {
   println("No saved token. Opening browser for authentication");    
   getAuthentication();
  }
}

// FLICKR AUTHENTICATION HELPER FUNCTIONS
// Attempts to authneticate with a given token
void authenticateWithToken(String _token) {
  AuthInterface authInterface = flickr.getAuthInterface();  
  
  // make sure the token is legit
  try {
    authInterface.checkToken(_token);
  }
  catch (Exception e) {
    println("Token is bad, getting a new one");
    getAuthentication();
    return;
  }
  
  auth = new Auth();

  RequestContext requestContext = RequestContext.getRequestContext();
  requestContext.setSharedSecret(secretKey);    
  requestContext.setAuth(auth);
  
  auth.setToken(_token);
  auth.setPermission(Permission.WRITE);
  flickr.setAuth(auth);
  println("Authentication success");
}


// Goes online to get user authentication from Flickr.
void getAuthentication() {
  AuthInterface authInterface = flickr.getAuthInterface();
  
  try {
    frob = authInterface.getFrob();
  } 
  catch (Exception e) {
    e.printStackTrace();
  }

  try {
    URL authURL = authInterface.buildAuthenticationUrl(Permission.WRITE, frob);
    
    // open the authentication URL in a browser
    open(authURL.toExternalForm());    
  }
  catch (Exception e) {
    e.printStackTrace();
  }

  println("You have 15 seconds to approve the app!");  
  int startedWaiting = millis();
  int waitDuration = 15 * 1000; // wait 10 seconds  
  while ((millis() - startedWaiting) < waitDuration) {
    // just wait
  }
  println("Done waiting");

  try {
    auth = authInterface.getToken(frob);
    println("Authentication success");
    // This token can be used until the user revokes it.
    token = auth.getToken();
    // save it for future use
    saveToken(token);
  }
  catch (Exception e) {
    e.printStackTrace();
  }
  
  // complete authentication
  authenticateWithToken(token);
}

// Writes the token to a file so we don't have
// to re-authenticate every time we run the app
void saveToken(String _token) {
  String[] toWrite = { _token };
  saveStrings("token.txt", toWrite);  
}

boolean fileExists(String filename) {
  File file = new File(sketchPath(filename));
  return file.exists();
}

// Load the token string from a file
String loadToken() {
  String[] toRead = loadStrings("token.txt");
  return toRead[0];
}

// IMAGE COMPRESSION HELPER FUNCTION

// Takes a PImage and compresses it into a JPEG byte stream
// Adapted from Dan Shiffman's UDP Sender code
byte[] compressImage(PImage img) {
  // We need a buffered image to do the JPG encoding
  BufferedImage bimg = new BufferedImage( img.width,img.height, BufferedImage.TYPE_INT_RGB );

  img.loadPixels();
  bimg.setRGB(0, 0, img.width, img.height, img.pixels, 0, img.width);

  // Need these output streams to get image as bytes for UDP communication
  ByteArrayOutputStream baStream  = new ByteArrayOutputStream();
  BufferedOutputStream bos    = new BufferedOutputStream(baStream);

  // Turn the BufferedImage into a JPG and put it in the BufferedOutputStream
  // Requires try/catch
  try {
    ImageIO.write(bimg, "jpg", bos);
  } 
  catch (IOException e) {
    e.printStackTrace();
  }

  // Get the byte array, which we will send out via UDP!
  return baStream.toByteArray();
}
