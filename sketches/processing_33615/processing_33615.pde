
/* VALUES YOU NEED TO PROVIDE */
 
// application api key and secret
String fbApiKey = "159599250785121";
String fbApiSecret = "ac08109925ab27e7d8482f73647bb40d";
 
// a comma separated (no spaces!) list of user ids
String fbUserIDs = "100000421181702";
 
/* other settings */
 
// Facebook RESTful API
String fbRestServer = "http://api.facebook.com";
String fbRestNode = "/restserver.php";
 
 
XMLElement[] usersXml;
int currentUser = 0;
 
 
void setup ()
{
  size( 300, 200 );
 
  // the details / params in here define what will be read, see:
  // http://wiki.developers.facebook.com/index.php/Users.getInfo
  String xmlResponse = fbCallMethod( new String[] {
    "method=facebook.Users.getInfo",   
    "uids=" + fbUserIDs,
    "fields=uid,first_name,last_name", // see link above for more options
    "format=XML"
  });
 
  if ( xmlResponse == null )  // an error occured
  {
      exit();
      return;
  }
 
  XMLElement xml = new XMLElement( xmlResponse );
  usersXml = xml.getChildren( "user" );
 
  fill( 0 );
  textFont( createFont( "sans-serif", 24 ) );
  textAlign( CENTER );
  frameRate( 1 );
}
 
 
void draw () 
{
  background( 255 );
 
  String full_name = usersXml[currentUser].getChild("first_name").getContent();
  full_name += " " + usersXml[currentUser].getChild("last_name").getContent();
 
  text( full_name, width/2, height/2 );
 
  currentUser++;
  currentUser %= usersXml.length; // modulo, wrap around
}
 
/**
 *  Place a Facebook call (GET request) using Processing API ( loadStrings(), join() )
 */
String fbCallMethod ( String[] args )
{
  String[] params = new String[args.length + 3];
  System.arraycopy( args, 0, params, 0, args.length );
  params[params.length-3] = "api_key=" + fbApiKey;
  params[params.length-2] = "call_id=" + System.currentTimeMillis();
  params[params.length-1] = "v=1.0";
 
  String sig = fbGenerateSIG ( params );
  String paramString = join( params, "&" ) + "&sig=" + sig;
 
  String[] lines = loadStrings( fbRestServer + fbRestNode + "?" + paramString );
 
  if ( lines == null )
  {
      println( "OUCH, nothing to read from that URL:\n" + fbRestServer + fbRestNode + "?" + paramString );
      return null;
  }
 
  String response = join( lines, "\n" );
 
  return response;
}
 
/**
 *  Generate a call signature, see:
 *  http://wiki.developers.facebook.com/index.php/How_Facebook_Authenticates_Your_Application
 *  http://wiki.developers.facebook.com/index.php/Authorization_and_Authentication_for_Desktop_Applications
 */
String fbGenerateSIG ( String[] args )
{
  java.util.Arrays.sort( args );
  String argString = join( args, "" );
  argString += fbApiSecret;
 
  return md5Encode( argString );
}
 
/**
 * MD5 encode a String using Processing API ( hex() )
 */
String md5Encode ( String data )
{
  java.security.MessageDigest digest = null;
  try {
    digest = java.security.MessageDigest.getInstance("MD5");
  } 
  catch ( java.security.NoSuchAlgorithmException nsae ) {
    nsae.printStackTrace();
  }
    digest.update( data.getBytes() );
  byte[] hash = digest.digest();
 
  StringBuilder hexed = new StringBuilder();
 
  for ( int i = 0; i < hash.length; i++ ) 
  {
    hexed.append( hex( hash[i], 2 ) );
  }
 
  return hexed.toString().toLowerCase();
}

