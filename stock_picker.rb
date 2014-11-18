def picker(prices)
    max_diff = 0

    for buy in 0...prices.length
        sell = buy + 1
        while sell < prices.length
	    	diff = prices[sell] - prices[buy] 
		    if diff > max_diff
                max_diff = diff
                best_buy = buy
                best_sell = sell
            end
            sell += 1
	    end
    end
	
    if max_diff <= 0
        "Don't buy!"
    else    
        "You should buy on day #{best_buy} and sell on 
        day #{best_sell} for a profit of #{max_diff}."
    end
end


picker([5,9,4,1,8,4,9,10])