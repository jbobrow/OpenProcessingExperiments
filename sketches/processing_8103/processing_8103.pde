

// Flickr has a HUGE API full of things that you can use
// The complete documentation for this is online: http://www.flickr.com/services/api/

// This file only provides support for a few of the API methods:
// flickr.photos.search


// this should be a 32 character long hexadecimal string.
private String flickrKey;

void setFlickrKey(String key) {
  flickrKey = key;
}

class FlickrPhotoShortResult {
  String id;
  String owner;
  String secret;
  String server;
  String farm;
  String title;

  String getImageUrl() {
    return "http://farm"+farm+".static.flickr.com/"+server+"/"+id+"_"+secret+".jpg";
  }
  String getPageUrl() {
    return "http://www.flickr.com/photos/"+owner+"/"+id;
  }
}

class FlickrPhoto {
  String id;
  String owner;
  String secret;
  String server;
  String farm;
  String title;

  String getImageUrl() {
    return "http://farm"+farm+".static.flickr.com/"+server+"/"+id+"_"+secret+".jpg";
  }
}


void flickrPhotosSearch(String searchText) {
  FlickrQuery query = new FlickrQuery();
  query.parameters.put("method","flickr.photos.search");
  query.parameters.put("text",searchText);
  query.parameters.put("api_key",flickrKey);
  query.executeAsynchronously();
}



//String flickrPhotoSearchS(String searchText) {
//  FlickrQuery query = new FlickrQuery();
//  query.parameters.put("method","flickr.photos.search");
//  query.parameters.put("text",searchText);
//  query.parameters.put("api_key",flickrKey);
//  query.executeAsynchronously(); 
//}

void flickrPhotosSearchRaw(Map parameters) {
  FlickrQuery query = new FlickrQuery();
  query.parameters.putAll(parameters);
  query.parameters.put("method","flickr.photos.search");
  query.parameters.put("api_key",flickrKey);
  query.executeAsynchronously();
}



// ***********************************
// FOLLOWING CODE MAY BE IGNORED
// UNLESS YOU WANT TO ADD SUPPORT FOR MORE FLICKR CALLS

class FlickrQuery extends Query {

  Map parameters = new HashMap();

  // DO NOT CALL THIS METHOD DIRECTLY
  void _performQuery() throws Exception {

    StringBuilder sb = new StringBuilder();

    // Construct the REST query.
    // This is documented at http://www.flickr.com/services/api/request.rest.html
    sb.append("http://api.flickr.com/services/rest/?");
    boolean first = true;
    for(Iterator iter = parameters.entrySet().iterator(); iter.hasNext(); ) {

      // add an ampersand to concatenate parameters
      if(!first) {
        sb.append("&");
      }
      first = false;

      Map.Entry entry = (Map.Entry) iter.next();
      String key = (String) entry.getKey();
      String value = (String) entry.getValue();

      // convert value to UTF format
      try {
        value = URLEncoder.encode(value, "UTF-8");
      } 
      catch(IOException ex) {
        // ?? ignore
      }

      sb.append(key +"="+value);
    }

    // Here is the final REST query
    String restQuery = sb.toString();

    XMLElement xml = new XMLElement(appletInstance, restQuery);

    if(xml.getChildCount() > 0) {
      XMLElement child = xml.getChild(0);
      String childName = child.getName();
      
      
      // HERE WE HANDLE THE DIFFERENT TYPES OF RESPONSES
      
      if("photos".equals(childName)) {
        returnResultPhotos(child);
      } 
//      else if("photo".equals(childName)) {
//        returnResultPhoto(child);
//      } 
      else {
        // unhandled Flickr response
        System.out.println("Unhandled Flickr response: "+child.getName());
        System.out.println("Problem with query?: ");
        System.out.println(restQuery);
      }
    } 
    else {
      // ??? NO CHILD: PROBLEM
      System.out.println("Flickr query returned no result!");
    }
  }

  void returnResultPhotos(XMLElement photos) {

    FlickrPhotoShortResult[] results = new FlickrPhotoShortResult[photos.getChildCount()];

    for(int i=0;i<photos.getChildCount();i++) {

      results[i] = new FlickrPhotoShortResult();
      XMLElement photo = photos.getChild(i);

      results[i].id = photo.getStringAttribute("id");
      results[i].secret = photo.getStringAttribute("secret");
      results[i].owner = photo.getStringAttribute("owner");
      results[i].farm = photo.getStringAttribute("farm");
      results[i].server = photo.getStringAttribute("server");
      results[i].title = photo.getStringAttribute("title");
    }

    onFlickrPhotos(results);
  }
}





