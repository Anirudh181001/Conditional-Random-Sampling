drop_series=zeros(1,654)
toctime = zeros(1,654)
w1=importdata("C:/Users/shriv/Desktop/words/ECONOMIC");
w2=importdata("C:\Users\shriv\Desktop\words\GROWTH");

A=load(w1);
B=load(w2);
tic
res = length(intersect(A,B))/length(union(A,B));
restime = toc;
i = 1
for g=0:100:65400
    tic
    [drop]=CResemblanceS(w1,w2,g);
    toctime(i) = toc;
    drop_series(1,g/100+1)=drop;
    i = i+1;
end

 %{
plot(0:100:65400,drop_series) %-- resemblance
hold on
plot(0:100:65400,(repmat(res,length(drop_series))),'r')
hold off
xlabel("k")
ylabel("resemblance")
%}

 %{
dist_kronos=zeros(1,654)
euclid_dist = pdist2(A,B); %--- one gets 615700x620940 (2848.5GB) array exceeding maximum array size preference showing the limitations of regular algorithms 
for g=0:100:65400
    [distance]=distanceCRS(w1,w2,g);
    dist_kronos(1,g/100+1)=distance;
end
plot(0:100:65400,dist_kronos)  %-- distance
hold on
plot(0:100:65400,(repmat(euclid_dist,length(toctime))),'r')
hold off
xlabel("k")
ylabel("time")
%}

% plot(0:100:65400,abs(res-drop_series)/res) %--relativeerrorfunction

 

%{
% TO PLOT TIME
plot(0:100:65400,toctime,'b')
hold on
plot(0:100:65400,(repmat(res,length(toctime))),'r')
hold off
xlabel("k")
ylabel("time")
%}



 