
/*
Fields and facets are key concepts for the Article Search API.
 
 A field is a piece of data. Some fields are searchable, others can be used as a facet.
 
 A facet is a special type of field. Facets help filter your search by specific fields such as publication year,
 month, etc.
 
 You can view a summary of all data fields here:
 http://developer.nytimes.com/docs/read/article_search_api#h3-data-fields
 */


void getFacets(ArrayList facets, String query, String publicationYear, String subject, String facet) {
  /*
  The Article Search API supports faceted searching, which can be much more powerful than standard 
   keyword searching. Facets (whose field names are appended with _facet for easy identification) can 
   help you explore Times-specific categories and subjects. 
   */


  /*
  First, we create a new search query object
   Note that each call to the TimesArticleSearch counts as an API call. The limit is 5000 calls per day.
   */
  TimesArticleSearch mySearch = new TimesArticleSearch();

  // Restrict the search to articles that contain certain keywords (can be left blank).
  mySearch.addQueries(query);

  // Restrict the search to a specified year
  mySearch.addFacetQuery("publication_year", publicationYear);

  // Restrict the search to a specified category.
  mySearch.addFacetQuery("des_facet", subject); // des stands for "descriptive subject term"
  //  mySearch.addFacetQuery("page_facet", page); 

  // Get number of articles for a particular facet, e.g. publication_month
  mySearch.addFacets(facet);

  // Now, we do the search, and get returned a TimesArticleSearch object, which contains the goodies.
  TimesArticleSearchResult myResult = mySearch.doSearch();

  /*
  We get the facet list from the search return - this is an array of TimesFacetObjects.
   Note that the NYT API can only return up to 15 facets at a time. You may have to make multiple calls to the
   API to get the amount of data you need.
   */
  TimesFacetObject[] getFacets = myResult.getFacetList(facet);

  /*
  // Print the number of matching articles for a particular facet (e.g. per month, per year, etc.)
  println("====================");
  println("Facets");
  */
  
  /*
  NOTE: I added this piece of code below to add months that aren't in the NYT facets dataset.
  */
  // build 12 empty facets, one for each month
  for (int i = 0; i < 12; i++) {

    String m = trim(nfs(i+1, 2));
    /*
    Saves the current month as a String of the format MM.
    Note: nfs() adds zeros to the number: http://processing.org/reference/nfs_.html.
    trim() trims any whitespace off of the ends of a string: http://processing.org/reference/trim_.html
    */

    // add empty facet to object array
    int index = facets.size(); // save index to current array object, to allow for chronological sorting later on (NOTE: the records are sorted chronologically by default)
    SearchObject facetObject = new SearchObject(index, query, publicationYear, m, 0, subject); // <-- initially set count to zero: we will be adding the number of articles below (assuming any exist!)
    facets.add(facetObject);
  }

  // now, return facet data and match to the corresponding empty facet we created above
  for (int i = 0; i < getFacets.length; i++) {
    // println(publicationYear + "-" + getFacets[i].term + ":" + getFacets[i].count);

    // match current facet to the empty facet in the ArrayList
    for (int n = 0; n < facets.size(); n++) {

      // extract facet from ArrayList
      SearchObject matchingFacet = (SearchObject) facets.get(n);

      // check for a match, for publication year and month
      if ((matchingFacet.publicationYear.equals(publicationYear)) && (matchingFacet.publicationMonth.equals(getFacets[i].term))) {  // was: getFacets[i].term

          // a match has been registered: add count data into existing empty facet
        matchingFacet.setCount(getFacets[i].count); // was: getFacets[i].count
      }
    }
  }
}


void saveResults(ArrayList dataSet, String filename) {

  /*
  Start by translating the ArrayList into a standard array.
   Make sure to use String[] to store your data for saving it to a textfile!
   */
  String[] saveData = new String[dataSet.size()];
  for (int i = 0; i < dataSet.size(); i++) {
    SearchObject dataObject = (SearchObject) dataSet.get(i);  

    saveData[i] = dataObject.query + "," + dataObject.publicationYear + "," + dataObject.publicationMonth + "," + dataObject.count + "," + dataObject.subject;
  }

  saveStrings(filename, saveData);
  println("Data has been saved to the text file: " + filename);
}


void loadData(ArrayList facets, String url) {

  String[] dataInput = loadStrings(url); // loads the data

  for (int j = 0; j < dataInput.length; j++) {

    String[] col = split(dataInput[j], ","); 

    String query = col[0];
    String publicationYear = col[1];
    String publicationMonth = col[2];
    int count = int(col[3]);
    String subject = col[4];
        
   //  println("DATA: " + j + ": " + query + " ," + publicationYear + ", " + publicationMonth + ", " + subject + ", " + count);
    
    // add facet to object arraylist
    SearchObject facetObject = new SearchObject(j, query, publicationYear, publicationMonth, count, subject); // <-- initially set count to zero: we will be adding the number of articles below (assuming any exist!)
    facets.add(facetObject);

  }
 
}


