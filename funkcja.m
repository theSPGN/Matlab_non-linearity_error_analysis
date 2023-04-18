function roznica = funkcja(Urosn,Umal,j,wannaline)
alfa = 0:10:300;
figure
plot(Umal,alfa,'r square-',Urosn,alfa,'b square-')
title(['Wykres zależności wychylenia tarczy przetwornika od napięcia ',int2str(j)])
xlabel('Napięcie [V]')
ylabel('Kąt/wychylenie tarczy [⁰]')
legend('Malejąco','Rosnąco')
grid minor
roznica = (Urosn-Umal)/62;
figure
for i = 1:length(alfa)
plot([alfa(i),alfa(i)],[0,abs(roznica(i))],'r-','lineWidth',5);
if wannaline >0
hold on;
xi=0:0.1:300;
yi=pchip(alfa,abs(roznica),xi);
plot(xi,yi,'-')
end
xlabel('Kąt/wychylenie tarczy [⁰]')
ylabel('Błąd niejednoznaczności')
title(['miara niejednoznaczności δ',int2str(j),'(alfa)'])
grid minor
hold on
end
end