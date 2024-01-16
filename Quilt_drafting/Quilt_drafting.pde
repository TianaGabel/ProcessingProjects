void settings(){
  size(widthInSquares * scale, heightInSquares * scale); //in order to use variables in size it must reside in a settings method
}

//Color order and intialization
color c1 = #0a3005; //darkGreen
color c2 = #70bd19; //lightGreen
color c3 = #77eb1e; //This will switched for a pattern later
color c6 = #111112; //blackJeans
color c5 = #3b4347; //stars
color c4 = #ffffff; //tatami
color[] p1 = { c1, c2, c3, c4, c5, c6 }; //CSU colors!
color[] p2 = {#0e2a38, #f0d5ce, #fa6843, #f71307, #e68c07}; //Royal Romance Palette
color[] p3 = {#f7ca8f, #006e26, #f7c00a,#fc3200,#d18904,#1f1b13}; //seed packet
color[] p4 = {#5c990c,#ba0404,#ebd071,#33473d,#1f1b13};


//Queen size Quilt: 84 x 94 square inches
//Quilt design based on 3 x 3 checkboard quiltting squares

/*USER DEFINED VARIABLES !!*/
color[] colors = p2;
int heightInSquares = 6;
int widthInSquares = 4;
int ms = 30;                  //pixel dimension of small squares
String shape = "Checkboard"; //"Circle" or "Checkboard" patterns are available
int rowShift = 1;            //shifts outer colors up or down, 1 is default
int colShift = 2;            //determines inner colors proximity to each other, 2 or 3 is default
int edgeOffset = 0;          //shifts print up or down by 1 square, 0 if default
boolean saveFile = true;     //true or false 
String fileName = "OpticalIllusionCircles.png";
/*End Variables*/

int scale = ms * 3;
//translate(xshift,yshift);
void setup(){
  noStroke();
  int edgeShift = -ms*(2 * (width - 1));
  edgeShift -= edgeShift % scale;
  edgeShift += ms * edgeOffset;
  translate(0,edgeShift);
  int actualHeight = ceil(heightInSquares + ((4 * (width - 1)) / 3.0));
  for (int i = 0; i < actualHeight; i++){
    for (int j = 0; j < widthInSquares; j++){
      pushMatrix();
      translate((j * scale),(i * scale));
      fill(colors[(j+rowShift) % colors.length]);
      rect(0,0,scale,scale);
      
      fill(colors[i % colors.length]);
      
      drawInnerShape(shape);
      
      popMatrix();
      translate(0,colShift*ms);
    }
    translate(0,-colShift*ms*(widthInSquares));
    rowShift += 1;
  }
  if (saveFile){
    save(fileName);
  }
}

void drawInnerShape(String shape){
  if (shape.equals("Checkboard")){
    translate(ms,ms);
      rect(ms,0,ms,ms);
      rect(-ms,0,ms,ms);
      rect(0,ms,ms,ms);
      rect(0,-ms,ms,ms);
  } else if (shape.equals("Circle")){
      translate(1.5*ms,1.5*ms);
      arc(scale,(colShift-1.5)*ms,3*ms,3*ms, PI, TWO_PI);
      arc(0,-1.5*ms,3*ms,3*ms, 0, PI);
  }
  
}
