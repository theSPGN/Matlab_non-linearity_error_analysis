clc
clear all
close all
%program rozwiązuje zagadnienie błędu nieliniowości podczas pomiaru
%przetwornika potencjometrycznego.
%%
U1rosn =[00.02 02.99 05.06 07.30 09.04 11.33 13.16 15.01 17.45 19.68 21.44 23.30 25.56 27.79 30.06 31.88 34.05 36.28 38.05 40.26 42.29 44.07 46.30 48.32 50.42 52.45 54.47 56.61 58.08 60.01 61.99];
U1mal=[00.02 02.99 05.08 07.31 09.05 11.33 13.16 15.09 17.39 19.58 21.29 23.26 25.41 27.65 29.82 31.88 33.78 35.90 37.37 40.04 42.13 43.73 46.14 48.08 50.42 52.02 54.14 56.68 57.99 60.02 61.99];
rozniaca1=funkcja(U1rosn,U1mal,1,0);
%%
U2rosn=[00.02 02.63 04.13 05.52 06.57 07.79 08.72 09.66 10.79 11.85 12.69 13.79 14.71 15.78 17.06 18.11 19.40 20.88 22.30 23.61 25.28 27.00 29.20 31.50 34.30 37.44 40.19 45.11 48.94 54.50 61.69];
U2mal=[00.02 02.62 04.15 05.56 06.56 07.79 08.72 09.66 10.77 11.85 12.65 13.59 14.67 15.71 17.01 18.08 19.28 20.69 21.35 23.49 25.24 26.61 29.07 31.21 34.17 36.62 40.12 45.48 48.69 54.55 61.69];
rozniaca2=funkcja(U2rosn,U2mal,2,0);
%%
U3rosn=[00.02 02.91 04.82 06.77 08.36 10.30 11.90 13.43 15.37 17.23 18.64 20.43 22.02 23.76 25.80 27.31 29.19 31.18 32.89 34.84 36.88 38.73 41.04 43.29 45.69 47.98 50.33 53.66 55.78 58.48 61.78];
U3mal=[00.03 02.91 04.91 06.68 08.36 10.25 11.90 13.43 15.32 17.16 18.60 20.13 21.95 23.85 25.59 27.30 29.16 30.87 32.85 34.89 36.88 38.73 40.90 43.00 45.67 47.61 50.18 53.58 55.78 58.63 61.78];
rozniaca3=funkcja(U3rosn,U3mal,3,0);

r1=max(rozniaca1);
r2=max(rozniaca2);
r3=max(rozniaca3);

figure
alfa = 0:10:300;
idealna=alfa*0.2067;

blad1 = (abs(U1rosn-idealna)/62);
blad2 = (abs(U2rosn-idealna)/62);
blad3 = (abs(U3rosn-idealna)/62);

blad1m = (abs(U1mal-idealna)/62);
blad2m = (abs(U2mal-idealna)/62);
blad3m = (abs(U3mal-idealna)/62);

blad1max = max(abs(U1rosn-idealna)/62);
blad2max = max(abs(U2rosn-idealna)/62);
blad3max = max(abs(U3rosn-idealna)/62);

blad1mmax = max(abs(U1mal-idealna)/62);
blad2mmax = max(abs(U2mal-idealna)/62);
blad3mmax = max(abs(U3mal-idealna)/62);

plot(alfa,blad1,'-*');
hold on;
grid minor;
plot(alfa,blad1m,'-*');
plot(alfa,blad2,'-*');
plot(alfa,blad2m,'-*');
plot(alfa,blad3,'-*');
plot(alfa,blad3m,'-*');
plot([0 300],[blad1max blad1max],'--r')
plot([0 300],[blad2mmax blad2mmax],'--g')
plot([0 300],[blad3max blad3max],'--b')
legend('Bład względny pomiar 1 rosnąco','Bład względny pomiar 1 malejąco','Bład względny pomiar 2 rosnąco','Bład względny pomiar 2 malejąco','Bład względny pomiar 3 rosnąco','Bład względny pomiar 3 malejąco','Max błąd p 1 =0.0184','Max błąd p 2 =0.2709','Max błąd p 3 =0.0754')
ylabel('Błąd względny')
xlabel('Wychylenie wskazówki przetwornika [°]')