
void getArticles(String apiKey, String source, String section, String timePeriod, String offset) {

  // base URL to Newswire API
  String api = "http://api.nytimes.com/svc/news/v3/content";

  // build API URL query from specified parameters
  String query = api + "/" + source + "/" + timePeriod + "?offset=" + offset + "&api-key=" + apiKey;
  println("Sending query to Newswire API: " + query);
  /*
  Here are several examples of a complete URL:
   http://api.nytimes.com/svc/news/v3/content/all/all.xml
   http://api.nytimes.com/svc/news/v3/content/nyt/business/72.xml
   http://api.nytimes.com/svc/news/v3/content/iht/business;world/168.xml
   http://api.nytimes.com/svc/news/v3/content/all/all.xml?limit=15&offset=50
   */


  // create JSON object from query String. requires JSON library! (see above)
  try { // try handles exceptions

    // first, return response from API as an array of Strings, using loadStrings()
    String[] responseLines = loadStrings(query);

    // next, join the array to a single String
    String response = join(responseLines, "");

    // then, create JSON object from the joined response so we can parse it
    JSONObject nytData = new JSONObject(response);

    /*
    Get JSONArray of results set.
     Note that the API only returns 15 results at a time. You may have to run multiple queries to return back more.
     */
    JSONArray results = nytData.getJSONArray("results");

    // iterate through results JSONArray
    for (int i = 0; i < results.length(); i++) { // a JSONArray uses a function length(), NOT size() or length

      // get JSON object for each result
      JSONObject obj = (JSONObject) results.get(i);

      /*
      Get data from individual JSON nodes.
       getString() returns the value of the specified JSON or XML node
       */

      // general article data
      String title = obj.getString("title"); // gets the article title
      String subHeadline = obj.getString("subheadline"); // gets the subheader for an article
      String byline = obj.getString("byline"); // gets the article byline
      String _abstract = obj.getString("abstract"); // gets the article abstract
      String publishedDate = obj.getString("published_date");
      String itemType = obj.getString("item_type"); // gets the type of an article, e.g. "Blog"
      String subSection = obj.getString("subsection"); // gets subsection, e.g. "Politics"
      String mainSection = obj.getString("section"); // gets main section, e.g. "U.S."
      String url = obj.getString("url"); // gets article URL
      String materialTypeFacet = obj.getString("material_type_facet"); // gets the type facet, e.g. "News"

      /*
      Get article arrays and facets
       */
      // first, declare and initialize JSONArray objects to store content
      JSONArray media = new JSONArray();
      JSONArray geoFacets = new JSONArray();
      JSONArray perFacets = new JSONArray();
      JSONArray desFacets = new JSONArray();
      JSONArray orgFacets = new JSONArray();

      /*
      next, convert article arrays and facets into JSONArray objects
       start by making sure each JSON object has content. Note: use equals("") instead of == when comparing Strings!
       */
      if (!obj.getString("multimedia").equals("")) {
        media = obj.getJSONArray("multimedia"); // gets any attached media, like photos. returns an array
      }
      if (!obj.getString("geo_facet").equals("")) {
        geoFacets = obj.getJSONArray("geo_facet"); // gets the related location facets, if they exist. returns an array
      }
      if (!obj.getString("per_facet").equals("")) {
        perFacets = obj.getJSONArray("per_facet"); // gets a related person facet, e.g. "OBAMA, BARACK"
      }
      if (!obj.getString("des_facet").equals("")) {
        desFacets = obj.getJSONArray("des_facet"); // gets the subjects facet as an array, e.g. [ "Elections", "Politics and Government" ]
      }
      if (!obj.getString("org_facet").equals("")) {
        orgFacets = obj.getJSONArray("org_facet"); // gets the organization facet as an array, e.g. "Google Inc|GOOG|NASDAQ"
      }

      // print article data
      println("....................");      
      println("Title: " + title);
      println("Sub-headline: " + subHeadline);
      println("Byline: " + byline);
      println("Publication type: " + itemType);
      println("Material type: " + materialTypeFacet);
      println("Section: " + mainSection);
      println("Sub-section: " + subSection);
      println("Abstract: " + _abstract);
      println("Published date: " + publishedDate);
      println("URL: " + url);

      println("Multimedia: " + media.length()); // note: in JSONArrays we use length() instead of size() or length.
      println("Locations: " + geoFacets.length());
      println("People: " + perFacets.length());
      println("Subjects: " + desFacets.length());
      println("Organizations: " + orgFacets.length());
    }
  }
  catch (JSONException e) {  
    println (e.toString());
  }
}


