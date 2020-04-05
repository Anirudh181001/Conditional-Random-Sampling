function [drop]=CResemblanceS(w1,w2,g)
    A=load(w1);
    B=load(w2);
    B_large=zeros(1,B(size(B,1),2));
    A_large=zeros(1,A(size(A,1),2));
    A_simple=zeros(g,2);

    i1=1;
    j1=1;

    while (i1<=size(B,1))
        if B(i1,2)==j1
            B_large(1,j1)=B(i1,1);
            i1=i1+1;
            j1=j1+1;
        else
            while (j1<B(i1,2))
        
                B_large(1,j1)=0;
                j1=j1+1;
            end
        end
    end

    i2=1;
    j2=1;

    while (i2<=size(A,1))
        if A(i2,2)==j2
            A_large(1,j2)=A(i2,1);
            i2=i2+1;
            j2=j2+1;
        else
            while (j2<A(i2,2))
          
                A_large(1,j2)=0;
                j2=j2+1;
            end
        end
    end

    l=length(A_large);
    a=randsample(l,l);
    a=a(1:g);
    A_simple(1:g,1)=A_large(a);
    A_simple(1:g,2)=a;


    %resemblence
    dropsmall=0;
    dropbig=0;
    for k=1:g
        if A_simple(k,2)<=length(B_large);
            dropsmall=dropsmall+min([A_simple(k,1) B_large(A_simple(k,2))]);
            dropbig=dropbig+max([A_simple(k,1) B_large(A_simple(k,2))]);
        else
            dropbig=dropbig+A_simple(k,1)
        end
    end
    drop=dropsmall/dropbig
end









    
    




    
        
    
    





