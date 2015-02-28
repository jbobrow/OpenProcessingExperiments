
//accounts-vie-exp-cat.csv

class Data {
  Table dataTable, metaTable;
  int rowOffsetHeader = 3;
  float maxValue = 0;

  Data(String dataFile, String metaFile) {
    dataTable = new Table(dataFile);
    metaTable = new Table(metaFile);

    for (int row = 0; row < getRowCount(); row++) {

      for (int col = 1; col < getColCount()-1; col++) {
        float value = getFloat(row, col);
        maxValue = max(maxValue, value);
      }
      
    }
  }

  String getHeader(String language) {
    if (language.equals("de")) {
      return dataTable.getString(0,0); //de
    }
    return dataTable.getString(1,0); // en
  }

  String getColName(int col) {
    String colShortName = dataTable.getString(rowOffsetHeader-1,col);
    String colName = metaTable.getString(metaTable.getRowIndex(colShortName),1);
    return colName;
  }

  int getRowCount() {
    return dataTable.rowCount-rowOffsetHeader;
  }

  int getColCount() {
    return dataTable.colCount;
  }

  String getString(int rowIndex, int column) {
    return dataTable.getString(rowIndex+rowOffsetHeader, column);
  }

  float getFloat(int rowIndex, int column) {
    return dataTable.getFloat(rowIndex+rowOffsetHeader, column);
  }
}


