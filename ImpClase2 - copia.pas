{1.- Implementar un programa que invoque a los siguientes m dulos.
a. Un m dulo recursivo que retorne un vector de a lo sumo 15 n meros enteros  random  mayores a 10 y menores a 155 (incluidos ambos). La carga finaliza con 
el valor 20.xxxxxxxxxxxxxxxxxx
b. Un m dulo no recursivo que reciba el vector generado en a) e imprima el contenido del vector. xxxxxxxxxx
c. Un m dulo recursivo que reciba el vector generado en a) e imprima el contenido del vector.xxxxxxxxxxxxxxxxxxx
d. Un modulo recursivo que reciba el vector generado en a) y devuelva la suma de los valores pares contenidos en el vector.xxxxxxxxxxx
e. Un modulo recursivo que reciba el vector generado en a) y devuelva el máximo valor del vector.xxxxxxxxxx
f. Un modulo recursivo que reciba el vector generado en a) y un valor y devuelva verdadero si dicho valor se encuentra en el vector o falso en caso contrario.xxxxxxxxxx
g. Un modulo que reciba el vector generado en a) e imprima, para cada n mero contenido en el vector, sus dígitos en el orden en que aparecen en el n mero. 
Debe implementarse un modulo recursivo que reciba el n mero e imprima lo pedido. Ejemplo si se lee el valor 142, se debe imprimir 1  4  2
}

Program Clase2MI;
const dimF = 15;
      min = 10;
      max = 155;
type vector = array [1..dimF] of integer;
     

procedure CargarVector (var v: vector; var dimL: integer);

  procedure CargarVectorRecursivo (var v: vector; var dimL: integer);
  var valor: integer;
  begin
    valor:= min + random (max - min + 1);
    if ((valor <> 20 ) and (dimL < dimF)) 
    then begin
          dimL:= dimL + 1;
          v[dimL]:= valor;
          CargarVectorRecursivo (v, dimL);
         end;
  end;
  
begin
  dimL:= 0;
  CargarVectorRecursivo (v, dimL);
end;
 
procedure ImprimirVector (v: vector; dimL: integer);
var
   i: integer;
begin
     for i:= 1 to dimL do
         write ('----');
     writeln;
     write (' ');
     for i:= 1 to dimL do begin
        write(v[i], ' | ');
     end;
     writeln;
     for i:= 1 to dimL do
         write ('----');
     writeln;
     writeln;
End;     

procedure ImprimirVectorRecursivo (v: vector; dimL: integer);
begin    
   if(diml<>0) then begin
	writeln(v[diml]);
	diml:= diml-1;
	ImprimirVectorRecursivo (v,diml);
	end;
end;
 
 function SumarRecursivo (v: vector; pos, dimL: integer): integer;

		  Begin
			if (pos <= dimL) {si la posicion no llego a diml hace esto}
			then SumarRecursivo:= SumarRecursivo (v, pos + 1, dimL) + v[pos] { al valor entero que retorne la funcion se lo suma a V[pos]}
			else SumarRecursivo:=0  {sino, SumaRecursivo devuelve 0}
		  End;
 
function Sumar (v:vector; dimL: integer): integer;
{------------------------------------------------------------------------}
	var pos: integer; 
	begin
	 pos:= 1;
	 Sumar:= SumarRecursivo (v, pos, dimL); {manda el vector, la posicion incial y DIML}
	end;

 


function  ObtenerMaximo (v: vector; dimL: integer): integer;
var maxRes:integer;
begin
    if (dimL=0) then
    ObtenerMaximo:=v[dimL] // Caso base: solo un elemento
	else
	maxRes := ObtenerMaximo(v, dimL - 1);
    
        if (v[dimL - 1] > maxRes)then
				ObtenerMaximo:= v[dimL - 1]
		else
            ObtenerMaximo:= maxRes;
end;     
     
function  BuscarValor (v: vector; dimL, valor: integer): boolean;
begin
  if((dimL>0) and (v[dimL]=valor)) then
	BuscarValor:=True
	else if(dimL>0)then
		BuscarValor:= BuscarValor (v,dimL-1,valor)
	else BuscarValor:=False;
end; 

procedure ImprimirDigitos(v: vector; dimL: integer); 
var 
  dig: integer;
begin    
  if (dimL = 0) then begin
    while (v[dimL] <> 0) do begin
      dig := v[dimL] mod 10;
      writeln(dig);
      v[dimL] := v[dimL] div 10;
    end;
  end
  else begin
    while (v[dimL] <> 0) do begin
      dig := v[dimL] mod 10;
      writeln(dig);
      v[dimL] := v[dimL] div 10;
    end;
    ImprimirDigitos(v, dimL - 1);
  end;
end;


var dimL, suma, maximo, valor: integer; 
    v: vector;
    encontre: boolean;
Begin 
  CargarVector (v, dimL);
  writeln;
  if (dimL = 0) then writeln ('--- Vector sin elementos ---')
                else begin
                       ImprimirVector (v, dimL);
                     {  ImprimirVectorRecursivo (v, dimL);}
                     end;
  writeln;
  writeln;                   
  suma:= Sumar(v, dimL);
  writeln;
  writeln;
  writeln('La suma de los valores del vector es ', suma); 
  writeln;
  writeln;
  maximo:= ObtenerMaximo(v, dimL);
  writeln;
  writeln;
  writeln('El maximo del vector es ', maximo); 
  writeln;
  writeln;
  write ('Ingrese un valor a buscar: ');
  read (valor);
  encontre:= BuscarValor(v, dimL, valor);
  writeln;
  writeln;
  if (encontre) then writeln('El ', valor, ' esta en el vector')
                else writeln('El ', valor, ' no esta en el vector');
                
  writeln;
  writeln;
  ImprimirDigitos (v, dimL);
end.
